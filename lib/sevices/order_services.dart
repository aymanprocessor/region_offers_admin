import 'dart:convert';
import '../common.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<OrderModel> getOrders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('api_token');
  var params = {'api_token': token};
  var uri = Uri.http('$serverIP', '$serverPath/shop/my-orders', params);
  final http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    return OrderModel.fromJson(jsonDecode(response.body));
    //print(response.body);

  } else {
    print('Failed to get orders list');
  }
  return null;
}

Future<OrderModel> acceptOrder(int orderId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('api_token');
  var params = {
    'api_token': token,
    'order_id': orderId.toString(),
  };
  var uri = Uri.http('$serverIP', '$serverPath/shop/accept-order', params);
  final http.Response response = await http.post(uri);
  if (response.statusCode == 200) {
    return OrderModel.fromJson(jsonDecode(response.body));
    //print(response.body);

  } else {
    print('Failed to accept orders list');
  }
  return null;
}

Future<OrderModel> rejectOrder(int orderId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('api_token');
  var params = {
    'api_token': token,
    'order_id': orderId.toString(),
  };
  var uri = Uri.http('$serverIP', '$serverPath/shop/reject-order', params);
  final http.Response response = await http.post(uri);
  if (response.statusCode == 200) {
    return OrderModel.fromJson(jsonDecode(response.body));
    //print(response.body);

  } else {
    print('Failed to accept orders list');
  }
  return null;
}

// Future getOrders() async {
//   List list = [
//     {
//       "name": "ايمن محمد سعد",
//       "phone": "01099613699",
//       "address": "شارع الصحافة - الجيزة",
//       "status": "pending",
//       "updated_at": "2019-11-20 21:23:41",
//       "orders": [
//         {
//           "name": "زيت",
//           "desc": "زيت عباد الشمس",
//           "cost": 30.0,
//           "quantity": "2 لتر",
//           "image":
//               "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/77/39288/1.jpg?6434",
//         },
//         {
//           "name": "شاي",
//           "desc": "شار ليبتون 100 فتلة",
//           "cost": 48.0,
//           "quantity": "100 فتلة",
//           "status": "pending",
//           "image":
//               "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Herbal-Drinks-And-Tea/lipton-tea-bags-100-Bags-550x550.jpg",
//         }
//       ],
//     },
//     {
//       "name": "انس",
//       "phone": "012547854",
//       "address": "شارع الصحافة - مدينة نصر",
//       "status": "rejected",
//       "updated_at": "2019-09-20 03:45:41",
//       "orders": [
//         {
//           "name": "زيت",
//           "desc": "زيت عباد الشمس",
//           "cost": 30.0,
//           "quantity": "2 لتر",
//           "image":
//               "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/77/39288/1.jpg?6434",
//         },
//         {
//           "name": "شاي",
//           "desc": "شار ليبتون 100 فتلة",
//           "cost": 48.0,
//           "quantity": "100 فتلة",
//           "image":
//               "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Herbal-Drinks-And-Tea/lipton-tea-bags-100-Bags-550x550.jpg"
//         }
//       ],
//     },
//     {
//       "name": "حسين محمود زارع",
//       "phone": "0155854745",
//       "address": "شارع الصحافة - رمسيس",
//       "updated_at": "2019-11-15 06:05:41",
//       "orders": [
//         {
//           "name": "زيت",
//           "desc": "زيت عباد الشمس",
//           "cost": 30.0,
//           "quantity": "2 لتر",
//           "image":
//               "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/77/39288/1.jpg?6434",
//         },
//         {
//           "name": "شاي",
//           "desc": "شار ليبتون 100 فتلة",
//           "cost": 48.0,
//           "quantity": "100 فتلة",
//           "image":
//               "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Herbal-Drinks-And-Tea/lipton-tea-bags-100-Bags-550x550.jpg",
//         }
//       ],
//     }
//   ];
//   return list;
// }
