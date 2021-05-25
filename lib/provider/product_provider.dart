import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:region_offers_admin/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common.dart';

class ProductsProvider extends StateNotifier<ProductModel> {
  ProductsProvider([ProductModel init]) : super(init ?? []);

  void fetchProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('api_token');
    var params = {'api_token': token};
    var uri = Uri.http('$serverIP', '$serverPath/shop/my-offers', params);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      state = ProductModel.fromJson(jsonDecode(response.body));
      //print(response.body);

    } else {
      print('Failed to get offers list');
    }
  }
}
