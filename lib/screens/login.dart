import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/screens/order_screen/order_list_view.dart';
import 'package:region_offers_admin/screens/profile.dart';
import 'package:region_offers_admin/screens/registration.dart';
import 'package:region_offers_admin/sevices/login_services.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final focusNode = FocusNode();

  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SharedPreferences prefs;
  String phone;
  String password;
  bool isAuth = true;

  init() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone') ?? null;
      password = prefs.getString('password') ?? null;
    });
    checkAuth();
  }

  checkAuth() {
    if (phone != null || password != null) {
      Get.off(OrderListView());
    } else {
      isAuth = false;
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isAuth
          ? SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  margin: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      SvgPicture.asset(
                        'assets/svg/food.svg',
                        height: 100.0,
                        width: 100.0,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      FormBuilder(
                        key: _fbKey,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              controller: phoneNumberController,
                              name: 'phone',
                              validator:FormBuilderValidators.compose( [
                                FormBuilderValidators.required(context,
                                    errorText: "please enter phone number".tr)
                              ]),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  labelText: 'Phone Number'.tr,
                                  border: outlineInputBorder),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FormBuilderTextField(
                              controller: passwordController,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.minLength(context,4,
                                    errorText:
                                        "password must be 4 characters at least"
                                            .tr),
                                FormBuilderValidators.required(context,
                                    errorText: "please enter password".tr)]),
                              obscureText: true,
                              name: 'password',
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  labelText: 'Password'.tr,
                                  border: outlineInputBorder),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ArgonButton(
                              borderRadius: 25.0,
                              height: 45.0,
                              width: MediaQuery.of(context).size.width * .8,
                              child: Text("SIGN IN".tr,
                                  style: TextStyle(color: Colors.white)),
                              loader: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )),
                              onTap:
                                  (startLoading, stopLoading, btnState) async {
                                if (_fbKey.currentState.validate()) {
                                  if (btnState == ButtonState.Idle) {
                                    startLoading();
                                    login(phoneNumberController.text,
                                            passwordController.text)
                                        .then((value) {
                                      if (value.status == 1) {
                                        prefs.setString('phone',
                                            phoneNumberController.text);
                                        prefs.setString('password',
                                            passwordController.text);
                                        prefs.setString(
                                            'api_token', value.data.apiToken);

                                        Get.off(OrderListView());
                                        stopLoading();
                                      } else if (value.status == 0) {
                                        Fluttertoast.showToast(
                                            msg: "${value.message}",
                                            toastLength: Toast.LENGTH_LONG);
                                        stopLoading();
                                      }
                                    }).catchError((err) {
                                      Fluttertoast.showToast(
                                          msg: "${err}",
                                          toastLength: Toast.LENGTH_LONG);
                                      stopLoading();
                                    });
                                  } else {}
                                }
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Don\'t have an Account? ".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Ubuntu")),
                              TextSpan(
                                  text: "Sign Up".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      pushPageLeft(context, Registration());
                                    })
                            ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
