import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:region_offers_admin/screens/login.dart';
import 'package:region_offers_admin/screens/order_screen/closed_order_list_view.dart';
import 'package:region_offers_admin/screens/order_screen/open_order_list_view.dart';
import 'package:region_offers_admin/screens/products/products_screen.dart';
import 'package:region_offers_admin/sevices/login_services.dart';
import 'package:region_offers_admin/sevices/order_services.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_utils/get_utils.dart';
import '../profile.dart';

class OrderListView extends StatefulWidget {
  @override
  _OrderListViewState createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  String phone;
  String password;

  Future<String> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString("phone");
    return phone;
  }

  SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone') ?? null;
      password = prefs.getString('password') ?? null;
    });
    checkAuth();
  }

  checkAuth() {
    if (phone == null || password == null) {
      pushPageWithReplaceUp(context, Login());
      return;
    }
  }

  OrderModel orders;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   init();
    // });

    // getOrders().then((value) {
    //   setState(() {
    //     orders = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton<Map<String, dynamic>>(
                onSelected: (Map<String, dynamic> value) {
                  switch (value["id"]) {
                    case 1:
                      Get.to(ProductsScreen(),
                          transition: Transition.downToUp,
                          curve: Curves.easeOutBack,
                          duration: Duration(milliseconds: 300));
                      break;
                    case 2:
                      Get.to(Profile());
                      break;
                    case 3:
                      logout();
                      break;
                  }
                },
                itemBuilder: (context) {
                  return [
                    {
                      "id": 1,
                      "title": "My Products".tr,
                      "icon": Icons.perm_media_outlined
                    },
                    {
                      "id": 2,
                      "title": "My Profile".tr,
                      "icon": Icons.person_outline
                    },
                    {"id": 3, "title": "Logout".tr, "icon": Icons.logout}
                  ].map((e) {
                    return PopupMenuItem<Map<String, dynamic>>(
                      value: e,
                      child: Row(
                        children: [
                          Icon(e["icon"]),
                          SizedBox(width: 8),
                          Text(e["title"]),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ],
            bottom: TabBar(tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Open'.tr),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Closed'.tr),
              )
            ]),
            title: Text('Orders'.tr),
            centerTitle: true,
          ),
          body: TabBarView(
              children: [OpenOrderListView(), ClosedOrderListView()])),
    );
  }
}
