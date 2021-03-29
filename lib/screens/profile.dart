import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/models/login_model.dart';
import 'package:region_offers_admin/screens/login.dart';
import 'package:region_offers_admin/screens/registration_edit.dart';
import 'package:region_offers_admin/sevices/login_services.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String phone;
  String password;

  SharedPreferences prefs;

  LoginModel user;
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

  getUserInfo() async {
    if (phone != null && password != null) {
      login(phone, password).then((value) {
        if (value != null) {
          Get.to(RegistrationEdit(user: value));
        }
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile".tr),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.edit_outlined),
                onPressed: () {
                  getUserInfo();
                }),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  logout();
                })
          ],
        ),
        body: FutureBuilder<LoginModel>(
            future: login(phone, password),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Container(
                      child: Column(
                    children: [
                      Image.network(
                        snapshot.data.data.data.photoUrl,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${snapshot.data.data.data.name}",
                          style: TextStyle(
                              fontSize: 20,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 0.5,
                                    offset: Offset(0, .25))
                              ])),

                      Text(
                        "${snapshot.data.data.data.nameAr}",
                        style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  blurRadius: 0.5,
                                  offset: Offset(0, .5))
                            ]),
                      ),

                      CustomCard(
                        icon: Icons.vpn_key_outlined,
                        title: "ID : " + snapshot.data.data.data.id.toString(),
                      ),
                      CustomCard(
                        icon: Icons.phone_android_outlined,
                        title: snapshot.data.data.data.phone,
                      ),
                      CustomCard(
                        icon: Icons.email_outlined,
                        title: snapshot.data.data.data.email,
                      ),
                      CustomCard(
                        icon: Icons.location_on_outlined,
                        title: snapshot.data.data.data.address,
                      ),
                      CustomCard(
                        icon: Icons.attach_money_outlined,
                        title: "Delivery Cost".tr +
                            snapshot.data.data.data.deliveryCost,
                      ),

                      //Image.network(snapshot.data.data.data.photoUrl),
                    ],
                  )),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Loading Data ...",
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ));
              }
            }));
  }
}

class CustomCard extends StatelessWidget {
  String title;
  IconData icon;
  double textSize;
  CustomCard({this.icon, this.title, this.textSize = 18});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon != null
                  ? Icon(icon, color: Colors.orange[300])
                  : Container(),
              SizedBox(
                width: 10,
              ),
              Text(title, style: TextStyle(fontSize: textSize))
            ],
          ),
        ),
      ),
    );
  }
}
