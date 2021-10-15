import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project/constants/api.dart';

class NetworkHelper {
  Future<dynamic> getUser() async {
    var response = await http.get(Uri.parse(getUserUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return;
    }
  }

  Future<dynamic> postAuthLogin({required phone, required password}) async {
    var response = await http.post(Uri.parse(postAuthLoginUrl),
        body: {'phone': phone, 'password': password});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return;
    }
  }

  Future<dynamic> postRegistration(
      {required phone,
      required password,
      required firstName,
      required lastName}) async {
    var response = await http.post(Uri.parse(postRegisterUrl), body: {
      'phone': phone,
      'password': password,
      'first_name': firstName,
      'last_name': lastName
    });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return;
    }
  }

  Future<dynamic> postForgotStart({required phone}) async {
    var response =
        await http.post(Uri.parse(postForgotStartUrl), body: {'phone': phone});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return;
    }
  }

  Future<dynamic> postForgotEnd(
      {required phone, required code, required password}) async {
    var response = await http.post(Uri.parse(postForgotEndUrl),
        body: {'phone': phone, 'code': code, 'password': password});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return;
    }
  }
}
