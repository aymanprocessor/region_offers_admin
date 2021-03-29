import 'package:flutter/material.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:region_offers_admin/screens/order_detail/order_detail.dart';
import 'package:region_offers_admin/screens/order_screen/widgets/display_date.dart';
import 'package:region_offers_admin/sevices/order_services.dart';
import 'package:region_offers_admin/util/push_page.dart';
import 'package:get/get_utils/get_utils.dart';

class OpenOrderListView extends StatefulWidget {
  @override
  _OpenOrderListViewState createState() => _OpenOrderListViewState();
}

class _OpenOrderListViewState extends State<OpenOrderListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OrderModel>(
        future: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No orders here'.tr),
              );
            } else {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.data.data.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data.data.data[index].state == "pending") {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            pushPageUp(
                                context,
                                OrderDetail(
                                  index: index,
                                  state: "pending",
                                  type: "open",
                                ));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      color: Colors.orange[200],
                                      child: DisplayDate(snapshot, index),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: Colors.orange[50],
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  snapshot
                                                      .data.data.data[index].id
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18.0)),
                                              SizedBox(height: 5.0),
                                              Text(
                                                  snapshot.data.data.data[index]
                                                      .client.name,
                                                  style: TextStyle(
                                                      fontSize: 18.0)),
                                              SizedBox(height: 5.0),
                                              Text(
                                                  snapshot.data.data.data[index]
                                                          .offers.length
                                                          .toString() +
                                                      "Request".tr,
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                              SizedBox(height: 5.0),
                                              Text(
                                                  snapshot.data.data.data[index]
                                                      .client.address,
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  });
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
