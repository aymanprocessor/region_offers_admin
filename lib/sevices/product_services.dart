import 'dart:convert';

import '../common.dart';
import 'package:region_offers_admin/models/product_model.dart';
import 'package:region_offers_admin/models/Responses/product_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

Future<ProductModel> getProducts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('api_token');
  var params = {'api_token': token};
  var uri = Uri.http('$serverIP', '$serverPath/shop/my-offers', params);
  final http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    return ProductModel.fromJson(jsonDecode(response.body));
    //print(response.body);

  } else {
    print('Failed to get offers list');
  }
  return null;
}

Future<ProductResModel> addProducts(ProductModelDataData product) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('api_token');
  // var params = {
  //   'api_token': token,
  //   'name': product.title,
  //   'title': product.title,
  //   'title_ar': product.titleAr,
  //   'price': product.price,
  //   'starting_at': product.startingAt,
  //   'ending_at': product.endingAt,
  //   'description': product.description,
  //   'description_ar': product.descriptionAr,
  // };
  //var uri = Uri.http('$serverIP', '$serverPath/shop/new-offer', params);
  //final http.Response response = await http.post(uri);

  var formData = FormData.fromMap({
    'api_token': token,
    'name': product.title,
    'title': product.title,
    'title_ar': product.titleAr,
    'price': product.price,
    'starting_at': product.startingAt,
    'ending_at': product.endingAt,
    'description': product.description,
    'description_ar': product.descriptionAr,
    'photo': await MultipartFile.fromFile(product.photo)
  });
  Response response;
  var dio = Dio();
  response = await dio.post(
      'http://' + '$serverIP' + '$serverPath/shop/new-offer',
      data: formData);
  if (response.statusCode == 200) {
    return ProductResModel.fromJson(response.data);
    //print(response.body);

  } else {
    print('Failed to get offers list');
  }
  return null;
}
