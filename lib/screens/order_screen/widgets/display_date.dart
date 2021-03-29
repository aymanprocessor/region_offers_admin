import 'package:flutter/widgets.dart';
import 'package:region_offers_admin/models/order_model.dart';
import 'package:region_offers_admin/util/shared.dart';
import 'package:get/get_utils/get_utils.dart';

class DisplayDate extends StatelessWidget {
  AsyncSnapshot<OrderModel> snapshot;
  int index;
  DisplayDate(this.snapshot, this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(snapshot.data.data.data[index].updatedAt.substring(8, 10),
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        Text(
            monthsInYear[
                    snapshot.data.data.data[index].updatedAt.substring(5, 7)]
                .tr,
            style: TextStyle(fontSize: 16.0)),
        SizedBox(height: 2),
        Text(snapshot.data.data.data[index].updatedAt.substring(0, 4),
            style: TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
