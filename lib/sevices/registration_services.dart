import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common.dart';
import 'package:http/http.dart' as http;
import 'package:region_offers_admin/models/registration_model.dart';

Future<Registration> registration(
    String phone,
    String password,
    String confirmPassword,
    String email,
    String name,
    String name_ar,
    String address,
    {String base64Image}) async {
  final http.Response response = await http.post(
    Uri.http(serverIP, serverPath + "/shop/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
      'delivery_cost': '10',
      'availability': '0',
      'category_id': '1',
      'delivery': '1',
      'takeaway': '1',
      'regions': ['1'],
      'minimum_charger': '10',
      'email': email,
      'name': name,
      'name_ar': name_ar,
      'address': address,
      //'photo': base64Image
    }),
  );

  if (response.statusCode == 200) {
    Fluttertoast.showToast(
      msg: "Registration Successful",
      backgroundColor: Colors.green,
    );
    return Registration.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Registration.');
  }
}

Future<Registration> registrationEdit(
    {@required String token,
    String email,
    String name,
    String nameAr,
    String address,
    String about,
    String base64Image}) async {
  final http.Response response = await http.post(
    Uri.http(serverIP, serverPath + "/shop/profile"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'api_token': token,
      'email': email,
      'name': name,
      'name_ar': nameAr,
      'address': address,
      //'about': about
      //'photo': base64Image
    }),
  );

  if (response.statusCode == 200) {
    Fluttertoast.showToast(
      msg: "Your Profile Updated",
      backgroundColor: Colors.green,
    );
    return Registration.fromJson(json.decode(response.body));
  } else {
    Fluttertoast.showToast(
      msg: "Error : ${response.statusCode}  ",
      backgroundColor: Colors.red,
    );
  }
}
