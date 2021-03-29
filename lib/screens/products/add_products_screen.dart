import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart' as intl;
import 'package:region_offers_admin/models/product_model.dart';
import 'package:region_offers_admin/sevices/product_services.dart';
import 'package:get/get_utils/get_utils.dart';

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
                        decoration: InputDecoration(
                            labelText: 'Price'.tr, border: outlineInputBorder),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
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
                  child: RaisedButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        // print(_formKey.currentState.value["title"]);
                        // print(_formKey.currentState.value["titleAr"]);
                        // print(_formKey.currentState.value["price"]);
                        // print(_formKey.currentState.value["desc"]);
                        // print(_formKey.currentState.value["descAr"]);
                        // print(_formKey.currentState.value["Date"][0]
                        //     .toString()
                        //     .substring(0, 10));
                        // print(_formKey.currentState.value["Date"][1]
                        //     .toString()
                        //     .substring(0, 10));
                        addProducts(ProductModelDataData(
                            title: _formKey.currentState.value["title"],
                            titleAr: _formKey.currentState.value["titleAr"],
                            price: _formKey.currentState.value["price"],
                            description: _formKey.currentState.value["desc"],
                            descriptionAr:
                                _formKey.currentState.value["descAr"],
                            endingAt: _formKey.currentState.value["Date"][0]
                                .toString()
                                .substring(0, 10),
                            startingAt: _formKey.currentState.value["Date"][1]
                                .toString()
                                .substring(0, 10)));
                        Get.back();
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
