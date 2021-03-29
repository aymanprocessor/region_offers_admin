import 'package:flutter/material.dart';
import 'package:region_offers_admin/screens/login.dart';
import 'package:region_offers_admin/screens/order_screen/order_list_view.dart';
import 'package:region_offers_admin/screens/profile.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/all.dart';

import 'translation/translations.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Messages(),
        locale: Locale('ar', 'EG'),
        fallbackLocale: Locale('en', 'US'),
        title: 'Region Offers Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Login());
  }
}
