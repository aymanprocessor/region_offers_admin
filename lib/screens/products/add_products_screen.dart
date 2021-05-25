import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart' as intl;
import 'package:region_offers_admin/models/product_model.dart';
import 'package:region_offers_admin/sevices/product_services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class AddProductsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Product".tr,
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width * .8,
                  child: Column(
                    children: [
                      Center(
                        child: FormBuilderImagePicker(
                            name: "image_picker",
                            // initialValue: [
                            //   File(
                            //       "/data/user/0/com.deafcoders.region_offers_admin/cache/image_picker4762926340877687258.jpg")
                            // ],
                            decoration:
                                InputDecoration(labelText: 'Pick Photos'.tr),
                            maxImages: 1),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: "title",
                        decoration: InputDecoration(
                            labelText: 'Title'.tr, border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: "titleAr",
                        decoration: InputDecoration(
                            labelText: 'Title by Arabic'.tr,
                            border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: "price",
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Price'.tr, border: outlineInputBorder),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context)
                        ]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: "desc",
                        decoration: InputDecoration(
                            labelText: 'Description'.tr,
                            border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: "descAr",
                        decoration: InputDecoration(
                            labelText: 'Description by Arabic'.tr,
                            border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                      ),
                      SizedBox(height: 10),
                      FormBuilderDateRangePicker(
                        firstDate: DateTime.utc(2021),
                        lastDate: DateTime.utc(2022),
                        format: intl.DateFormat('yyyy-MM-dd'),
                        name: "Date",
                        decoration: InputDecoration(
                            labelText: 'Offer Time'.tr,
                            border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  minWidth: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        // File file =
                        //     _formKey.currentState.value["image_picker"][0];
                        // print(file.path);
                        // print(_formKey.currentState.value["title"]);
                        // print(_formKey.currentState.value["titleAr"]);
                        // print(_formKey.currentState.value["price"]);
                        // print(_formKey.currentState.value["desc"]);
                        // print(_formKey.currentState.value["descAr"]);
                        // print(_formKey.currentState.value["Date"]
                        //     .toString()
                        //     .substring(26, 36));
                        // print(_formKey.currentState.value["Date"]
                        //     .toString()
                        //     .substring(0, 10));
                        addProducts(ProductModelDataData(
                                photo: (_formKey.currentState
                                        .value["image_picker"][0] as File)
                                    .path,
                                title: _formKey.currentState.value["title"],
                                titleAr: _formKey.currentState.value["titleAr"],
                                price: _formKey.currentState.value["price"],
                                description:
                                    _formKey.currentState.value["desc"],
                                descriptionAr:
                                    _formKey.currentState.value["descAr"],
                                endingAt: _formKey.currentState.value["Date"]
                                    .toString()
                                    .substring(26, 36),
                                startingAt: _formKey.currentState.value["Date"]
                                    .toString()
                                    .substring(0, 10)))
                            .then((response) {
                          switch (response.status) {
                            case 0:
                              Fluttertoast.showToast(
                                  msg: response.message.toString(),
                                  toastLength: Toast.LENGTH_LONG);
                              break;
                            case 1:
                              Fluttertoast.showToast(
                                  msg: response.message.toString(),
                                  toastLength: Toast.LENGTH_LONG);
                              Get.back();
                              break;
                            default:
                          }
                        });
                      } else {
                        print("validation failed");
                      }
                    },
                    child: Text("Add".tr, style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
