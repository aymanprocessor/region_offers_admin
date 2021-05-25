import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:region_offers_admin/screens/login.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common.dart';

Future<LoginModel> login(String phone, String password) async {
  final http.Response response = await http.post(
    loginUri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return LoginModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to login.');
  }
}

logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('phone');
  prefs.remove('password');
  prefs.remove('api_token');
  Get.off(Login());
}
