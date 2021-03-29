import 'package:flutter/material.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:region_offers_admin/sevices/order_services.dart';
import '../order_detail/order_detail.dart';
import '../../util/push_page.dart';
import 'widgets/display_date.dart';
import 'package:get/get_utils/get_utils.dart';

class ClosedOrderListView extends StatefulWidget {
  @override
  _ClosedOrderListViewState createState() => _ClosedOrderListViewState();
}

class _ClosedOrderListViewState extends State<ClosedOrderListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OrderModel>(
        future: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('No orders here'.tr),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.data.data.length,
                  itemBuilder: (context, index) {
                    bool isAccepted =
                        snapshot.data.data.data[index].state.toString() ==
                                "accepted"
                            ? true
                            : false;
                    if (snapshot.data.data.data[index].state != "pending") {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            pushPageUp(
                                context,
                                OrderDetail(
                                    type: "closed",
                                    index: index,
                                    state:
                                        isAccepted ? "accepted" : "rejected"));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          color: isAccepted
                                              ? Colors.green[200]
                                              : Colors.red[200],
                                          child: DisplayDate(snapshot, index),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    width: double.infinity,
                                                    color: isAccepted
                                                        ? Colors.green[50]
                                                        : Colors.red[50],
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            snapshot.data.data
                                                                .data[index].id
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    18.0)),
                                                        Text(
                                                            snapshot
                                                                        .data
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .state
                                                                        .toString() ==
                                                                    "accepted"
                                                                ? "Accepted".tr
                                                                : "Rejected".tr,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    18.0)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  Text(
                                                      snapshot
                                                          .data
                                                          .data
                                                          .data[index]
                                                          .client
                                                          .name,
                                                      style: TextStyle(
                                                          fontSize: 18.0)),
                                                  SizedBox(height: 5.0),
                                                  Text(
                                                      snapshot
                                                              .data
                                                              .data
                                                              .data[index]
                                                              .offers
                                                              .length
                                                              .toString() +
                                                          "Request".tr,
                                                      style: TextStyle(
                                                          fontSize: 15.0)),
                                                  SizedBox(height: 5.0),
                                                  Text(
                                                      snapshot
                                                          .data
                                                          .data
                                                          .data[index]
                                                          .client
                                                          .address,
                                                      style: TextStyle(
                                                          fontSize: 15.0)),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: RaisedButton.icon(
                                //         icon: Icon(
                                //           Icons.arrow_back,
                                //         ),
                                //         onPressed: () {},
                                //         label: Text("Prev"),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: RaisedButton.icon(
                                //         icon: Icon(Icons.arrow_forward),
                                //         onPressed: () {},
                                //         label: Text("Next"),
                                //       ),
                                //     )
                                //   ],
                                // )
                              ],
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
