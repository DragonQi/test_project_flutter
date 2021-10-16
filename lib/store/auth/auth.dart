import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:test_project/constants/api.dart';
import 'package:test_project/services/network_helper.dart';

part 'auth.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  NetworkHelper network = NetworkHelper();

  @observable
  String? phone;

  @observable
  String? password;

  @observable
  dynamic userData;

  @action
  void setPhone(value) {
    phone = value;
    print(value);
  }

  @action
  void setPassword(value) {
    password = value;
    print(value);
  }

  @action
  Future<http.Response> loginUser() async {
    final response = await http.post(
      Uri.parse(postAuthLoginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone!,
        'password': password!,
      }),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return userData = jsonDecode(response.body);
    } else {
      print(response.statusCode);
      var i = jsonDecode(response.body);
      print(i['message']);
      throw Exception(response.statusCode);
    }
  }
}
