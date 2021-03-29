import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:region_offers_admin/models/product_model.dart';
import 'package:region_offers_admin/sevices/product_services.dart';

class ProductsProvider extends StateNotifier<ProductModel> {
  ProductsProvider([ProductModel init]) : super(init ?? []);

  void fetchProducts() async {
    state = await getProducts();
  }
}
