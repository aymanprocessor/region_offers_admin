import 'dart:convert';
import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/screens/login.dart';
import 'package:region_offers_admin/sevices/registration_services.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:region_offers_admin/widgets/dividerwithtext.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final englishNameController = TextEditingController();
  final arabicNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  bool securePassword = true;
  bool secureConfirmPassword = true;

  Color snifixIconColor = Colors.grey[600];

  String base64Image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // phoneNumberController.text = '01254875421';
    // emailController.text = 'aymansaad@gmail.com';
    // passwordController.text = '123456';
    // confirmPasswordController.text = '123456';
    // englishNameController.text = 'Ayman';
    // arabicNameController.text = 'ايمن';
    // shopAddressController.text = 'giza';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(top: 20.0, bottom: 50.0),
            child: Column(
              children: [
                FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: [
                        Text(
                          "Registration".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30.0),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ASDivider("Account".tr),
                        SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.phone,
                          controller: phoneNumberController,
                          name: 'phone',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr),
                            FormBuilderValidators.minLength(context, 11,
                                errorText: "please enter valid phone number".tr)
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          name: 'email',
                          validator: FormBuilderValidators.compose([
                            // FormBuilderValidators.required(
                            //     errorText: "please enter email"),
                            FormBuilderValidators.email(context,
                                errorText: "please enter a valid email".tr)
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'Email (optional)'.tr,
                              border: outlineInputBorder),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: securePassword,
                          name: 'password',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.minLength(context, 8,
                                errorText:
                                    "password must be 8 characters at least"
                                        .tr),
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr)
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              suffix: InkWell(
                                child: securePassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: snifixIconColor,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: snifixIconColor,
                                      ),
                                onTap: () {
                                  setState(() {
                                    securePassword = !securePassword;
                                  });
                                },
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'Password'.tr,
                              border: outlineInputBorder),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          obscureText: secureConfirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          name: 'confirmPassword',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.minLength(context, 8,
                                errorText:
                                    "password must be 8 characters at least"
                                        .tr),
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr),
                            (val) {
                              if (val !=
                                  _fbKey
                                      .currentState.fields['password']?.value) {
                                return "password don\'t match".tr;
                              }
                              return null;
                            }
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              suffix: InkWell(
                                child: secureConfirmPassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: snifixIconColor,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: snifixIconColor,
                                      ),
                                onTap: () {
                                  setState(() {
                                    secureConfirmPassword =
                                        !secureConfirmPassword;
                                  });
                                },
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'Confirm Password'.tr,
                              border: outlineInputBorder),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ASDivider("Shop Information".tr),
                        SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          controller: englishNameController,
                          name: 'english_shop_name',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr),
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.store_mall_directory),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'English Shop Name'.tr,
                              border: outlineInputBorder),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          controller: arabicNameController,
                          name: 'arabic_shop_name',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr),
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.store_mall_directory),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'Arabic Shop Name'.tr,
                              border: outlineInputBorder),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.streetAddress,
                          controller: shopAddressController,
                          name: 'shop_address',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: "This field cannot be empty".tr),
                          ]),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_location),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              labelText: 'Shop Address'.tr,
                              border: outlineInputBorder),
                        ),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        // FormBuilderImagePicker(
                        //   onChanged: (file) async {
                        //     print(file);

                        //     File imageFile = file[0];

                        //     final imageBytes = await imageFile.readAsBytes();
                        //     print(imageBytes);

                        //     setState(() {
                        //       base64Image = base64Encode(imageBytes);
                        //     });
                        //   },
                        //   attribute: 'photo',
                        //   maxImages: 1,
                        //   validators: [
                        //     FormBuilderValidators.required(
                        //         errorText: "please pick shop photo"),
                        //   ],
                        //   decoration: InputDecoration(
                        //     contentPadding: EdgeInsets.all(10.0),
                        //     labelText: 'Shop Photo',
                        //   ),
                        // ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ArgonButton(
                          borderRadius: 25.0,
                          height: 45.0,
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text("Sign Up".tr,
                              style: TextStyle(color: Colors.white)),
                          loader: Container(
                              padding: EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )),
                          onTap: (startLoading, stopLoading, btnState) async {
                            if (_fbKey.currentState.validate()) {
                              if (btnState == ButtonState.Idle) {
                                startLoading();
                                registration(
                                        phoneNumberController.text,
                                        passwordController.text,
                                        confirmPasswordController.text,
                                        emailController.text,
                                        englishNameController.text,
                                        arabicNameController.text,
                                        shopAddressController.text
                                        //base64Image
                                        )
                                    .then((value) {
                                  if (value.status == 0) {
                                    Fluttertoast.showToast(
                                        msg: "${value.message}",
                                        toastLength: Toast.LENGTH_LONG);
                                    stopLoading();
                                  } else if (value.status == 1) {
                                    Fluttertoast.showToast(
                                        msg: "${value.message}",
                                        toastLength: Toast.LENGTH_LONG);
                                    Get.to(Login());
                                    stopLoading();
                                  }
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Already a Member? ".tr,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Ubuntu")),
                          TextSpan(
                              text: "SIGN IN".tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu"),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  pushPageRight(context, Login());
                                })
                        ]))
                      ],
                    ))
              ],
            )),
      )),
    ));
  }
}
