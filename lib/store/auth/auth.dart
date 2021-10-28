import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:test_project/constants/api.dart';

part 'auth.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  @observable
  String phone = '';

  @observable
  String password = '';

  @observable
  dynamic userData;

  @observable
  bool loading = false;

  @action
  void setPhone(value) {
    phone = value;
  }

  @action
  void setPassword(value) {
    password = value;
  }

  @action
  Future<http.Response> loginUser() async {
    loading = true;
    final response = await http.post(
      Uri.parse(postAuthLoginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': '7$phone',
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      loading = false;
      return userData = jsonDecode(response.body);
    } else {
      loading = false;
      var data = jsonDecode(response.body);
      print(data['message']);
      throw Exception(response.statusCode);
    }
  }
}
