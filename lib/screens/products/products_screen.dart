import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';
import 'package:region_offers_admin/provider/product_provider.dart';
import 'package:region_offers_admin/screens/products/add_products_screen.dart';
import '../../sevices/product_services.dart';
import '../../models/product_model.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductsScreen extends ConsumerWidget {
  final productProvider = FutureProvider<ProductModel>((ref) async {
    final getProd = await ref.watch(ProductsProvider);
  });
  @override
  Widget build(BuildContext context, watch) {
    final products = watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Products".tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddProductsScreen());
              // addProducts(ProductModelDataData(
              //     title: "Sun Shine ${Random().nextInt(100)}",
              //     titleAr: "صن شاين",
              //     price: "20",
              //     description: "sun shine 200 gm",
              //     descriptionAr: "صن شاين 200 جم",
              //     endingAt: "2020-05-13",
              //     startingAt: "1997-05-13"));
            },
          )
        ],
      ),
      body: Center(
        child: products.when(
            data: (value) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                itemCount: value.data.data.length,
                itemBuilder: (context, index) {
                  final product = value.data.data[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.titleAr,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    product.descriptionAr,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    product.price + " " + "pound".tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "from".tr +
                                        product.startingAt.substring(0, 10) +
                                        "  " +
                                        "to".tr +
                                        product.endingAt.substring(0, 10),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: CachedNetworkImage(
                                  imageUrl: product.photoUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator()),
                                      ),
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      child: Image.asset(
                                        'assets/png/delete.png',
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (error, stack) => Text('${error.toString()}')),
      ),
    );
  }
}
