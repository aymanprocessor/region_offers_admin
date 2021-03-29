import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:region_offers_admin/sevices/order_services.dart';
import 'package:get/route_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderDetail extends StatefulWidget {
  int index;
  String state;
  String type;
  OrderDetail({this.index, this.state, this.type});
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Detail".tr),
          centerTitle: true,
        ),
        body: FutureBuilder<OrderModel>(
            future: getOrders(),
            builder: (context, order) {
              if (!order.hasData || order.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(order.data.data.data[widget.index].client.name,
                        style: TextStyle(fontSize: 20.0)),
                    Text(order.data.data.data[widget.index].client.address,
                        style: TextStyle(fontSize: 15.0)),
                    Text(order.data.data.data[widget.index].client.phone,
                        style: TextStyle(fontSize: 15.0)),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            order.data.data.data[widget.index].offers.length,
                        itemBuilder: (context, cindex) {
                          return DataTable(
                            columns: [
                              DataColumn(label: Text('photo'.tr)),
                              DataColumn(label: Text('Name'.tr)),
                              DataColumn(label: Text('Cost'.tr)),
                              DataColumn(label: Text('Total'.tr)),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Center(
                                  child: Image.network(order
                                      .data
                                      .data
                                      .data[widget.index]
                                      .offers[cindex]
                                      .photoUrl),
                                )),
                                DataCell(Center(
                                  child: Text(order.data.data.data[widget.index]
                                      .offers[cindex].title),
                                )),
                                DataCell(Center(
                                  child: Text(order.data.data.data[widget.index]
                                          .offers[cindex].pivot.quantity
                                          .toString() +
                                      "  X\n" +
                                      order.data.data.data[widget.index]
                                          .offers[cindex].pivot.price
                                          .toString()),
                                )),
                                DataCell(Center(
                                  child: Text(
                                      order.data.data.data[widget.index].cost),
                                )),
                              ]),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery".tr, style: TextStyle(fontSize: 20)),
                          Text(
                              "+ " +
                                  order.data.data.data[widget.index]
                                      .deliveryCost,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total".tr, style: TextStyle(fontSize: 20)),
                          Text(order.data.data.data[widget.index].total,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    widget.type == "open"
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    disabledColor: Colors.grey,
                                    onPressed: widget.state == "accepted" ||
                                            widget.state == "pending"
                                        ? () {
                                            rejectOrder(order.data.data
                                                    .data[widget.index].id)
                                                .then((value) {
                                              Fluttertoast.showToast(
                                                  msg: "Order Rejected");
                                              Get.back();
                                              setState(() {});
                                            }).catchError((err) =>
                                                    Fluttertoast.showToast(
                                                        msg: "Error : $err"));
                                          }
                                        : null,
                                    child: Text("Rejact"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    color: Colors.green,
                                    disabledColor: Colors.grey,
                                    onPressed: widget.state == "rejected" ||
                                            widget.state == "pending"
                                        ? () {
                                            acceptOrder(order.data.data
                                                    .data[widget.index].id)
                                                .then((value) {
                                              Fluttertoast.showToast(
                                                  msg: "Order Accepted");

                                              Get.back();
                                              setState(() {});
                                            }).catchError((err) =>
                                                    Fluttertoast.showToast(
                                                        msg: "Error : $err"));
                                          }
                                        : null,
                                    child: Text("Accept"),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            }));
  }
}
