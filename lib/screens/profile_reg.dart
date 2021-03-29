import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileReg extends StatefulWidget {
  @override
  _ProfileRegState createState() => _ProfileRegState();
}

class _ProfileRegState extends State<ProfileReg> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Column(
                  children: [
                    FormBuilder(
                        key: _fbKey,
                        child: Column(
                          children: [
                            Text(
                              "Initial Your Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            FormBuilderTextField(
                              keyboardType: TextInputType.phone,
                              controller: phoneNumberController,
                              name: 'name',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "please enter phone number"),
                                FormBuilderValidators.minLength(context,11,
                                    errorText:
                                        "please enter valid phone number")
                              ]),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                labelText: 'Phone Number',
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ))),
    );
  }
}
