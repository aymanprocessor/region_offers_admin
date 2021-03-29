import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:region_offers_admin/models/login_model.dart';
import 'package:region_offers_admin/sevices/registration_services.dart';
import 'package:region_offers_admin/widgets/dividerwithtext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationEdit extends StatefulWidget {
  LoginModel user;
  RegistrationEdit({this.user});
  @override
  _RegistrationEditState createState() => _RegistrationEditState();
}

class _RegistrationEditState extends State<RegistrationEdit> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final englishNameController = TextEditingController();
  final arabicNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final aboutController = TextEditingController();
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  bool securePassword = true;
  bool secureConfirmPassword = true;

  Color snifixIconColor = Colors.grey[600];

  String base64Image;

  String phone;
  String password;
  LoginModel user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUserInfo();
    user = widget.user;
    if (user != null) {
      phoneNumberController.text = user.data.data.phone ?? "";
      emailController.text = user.data.data.email ?? "";

      englishNameController.text = user.data.data.name ?? "";
      arabicNameController.text = user.data.data.nameAr ?? "";
      shopAddressController.text = user.data.data.address ?? "";
      aboutController.text = user.data.data.about ?? "";
    }

    // phoneNumberController.text = user.data.data.phone;
    // emailController.text = user.data.data.email;
    // englishNameController.text = user.data.data.name;
    // arabicNameController.text = user.data.data.nameAr;
    // shopAddressController.text = user.data.data.address;
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone = prefs.getString("phone");
    password = prefs.getString("password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile".tr),
          centerTitle: true,
        ),
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
                            SizedBox(
                              height: 15.0,
                            ),
                            // ASDivider("Account"),
                            // SizedBox(
                            //   height: 10.0,
                            // ),
                            // FormBuilderTextField(
                            //   keyboardType: TextInputType.phone,
                            //   controller: phoneNumberController,
                            //   attribute: 'phone',
                            //   validators: [
                            //     FormBuilderValidators.required(
                            //         errorText: "please enter phone number"),
                            //     FormBuilderValidators.minLength(11,
                            //         errorText: "please enter valid phone number")
                            //   ],
                            //   decoration: InputDecoration(
                            //       prefixIcon: Icon(Icons.phone),
                            //       contentPadding:
                            //           EdgeInsets.symmetric(horizontal: 10.0),
                            //       labelText: 'Phone Number',
                            //       border: outlineInputBorder),
                            // ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // FormBuilderTextField(
                            //   controller: emailController,
                            //   keyboardType: TextInputType.emailAddress,
                            //   attribute: 'email',
                            //   validators: [
                            //     FormBuilderValidators.required(
                            //         errorText: "please enter email"),
                            //     FormBuilderValidators.email(
                            //         errorText: "please enter valid email")
                            //   ],
                            //   decoration: InputDecoration(
                            //       prefixIcon: Icon(Icons.email),
                            //       contentPadding:
                            //           EdgeInsets.symmetric(horizontal: 10.0),
                            //       labelText: 'Email',
                            //       border: outlineInputBorder),
                            // ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // FormBuilderTextField(
                            //   controller: passwordController,
                            //   keyboardType: TextInputType.visiblePassword,
                            //   obscureText: securePassword,
                            //   attribute: 'password',
                            //   validators: [
                            //     FormBuilderValidators.minLength(8,
                            //         errorText:
                            //             "password must be 8 characters at least"),
                            //     FormBuilderValidators.required(
                            //         errorText: "please enter password")
                            //   ],
                            //   decoration: InputDecoration(
                            //       prefixIcon: Icon(Icons.vpn_key),
                            //       suffix: InkWell(
                            //         child: securePassword
                            //             ? Icon(
                            //                 Icons.visibility,
                            //                 color: snifixIconColor,
                            //               )
                            //             : Icon(
                            //                 Icons.visibility_off,
                            //                 color: snifixIconColor,
                            //               ),
                            //         onTap: () {
                            //           setState(() {
                            //             securePassword = !securePassword;
                            //           });
                            //         },
                            //       ),
                            //       contentPadding:
                            //           EdgeInsets.symmetric(horizontal: 10.0),
                            //       labelText: 'Password',
                            //       border: outlineInputBorder),
                            // ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // FormBuilderTextField(
                            //   obscureText: secureConfirmPassword,
                            //   keyboardType: TextInputType.visiblePassword,
                            //   controller: confirmPasswordController,
                            //   attribute: 'confirmPassword',
                            //   validators: [
                            //     FormBuilderValidators.minLength(8,
                            //         errorText:
                            //             "confirm password must be 8 characters at least"),
                            //     FormBuilderValidators.required(
                            //         errorText: "please enter confirm password"),
                            //     (val) {
                            //       if (val !=
                            //           _fbKey.currentState.fields['password']
                            //               .currentState.value) {
                            //         return "password don\'t match";
                            //       }
                            //       return null;
                            //     }
                            //   ],
                            //   decoration: InputDecoration(
                            //       prefixIcon: Icon(Icons.vpn_key),
                            //       suffix: InkWell(
                            //         child: secureConfirmPassword
                            //             ? Icon(
                            //                 Icons.visibility,
                            //                 color: snifixIconColor,
                            //               )
                            //             : Icon(
                            //                 Icons.visibility_off,
                            //                 color: snifixIconColor,
                            //               ),
                            //         onTap: () {
                            //           setState(() {
                            //             secureConfirmPassword =
                            //                 !secureConfirmPassword;
                            //           });
                            //         },
                            //       ),
                            //       contentPadding:
                            //           EdgeInsets.symmetric(horizontal: 10.0),
                            //       labelText: 'Confirm Password',
                            //       border: outlineInputBorder),
                            // ),
                            // SizedBox(
                            //   height: 10.0,
                            // ),
                            ASDivider("Shop Information".tr),
                            SizedBox(
                              height: 10.0,
                            ),
                            FormBuilderTextField(
                              controller: englishNameController,
                              name: 'english_shop_name',
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
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.add_location),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  labelText: 'Shop Address'.tr,
                                  border: outlineInputBorder),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FormBuilderTextField(
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              controller: aboutController,
                              name: 'about',
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.insert_drive_file_outlined),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 15),
                                  labelText: 'About Shop'.tr,
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
                              child: Text("Update Profile".tr,
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
                                    registrationEdit(
                                            token: user.data.apiToken,
                                            name: englishNameController.text,
                                            nameAr: arabicNameController.text,
                                            address: shopAddressController.text,
                                            about: aboutController.text
                                            //base64Image
                                            )
                                        .then((value) {
                                      if (value.status == 0) {
                                        Fluttertoast.showToast(
                                            msg: "${value.message}",
                                            toastLength: Toast.LENGTH_LONG);
                                        stopLoading();
                                      } else if (value.status == 1) {
                                        Get.back();
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
                          ],
                        ))
                  ],
                )),
          )),
        ));
  }
}
