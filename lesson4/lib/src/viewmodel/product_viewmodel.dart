import 'package:flutter/material.dart';
import 'package:lesson4/src/data/product.dart';

import '../repo/product_repo.dart';

class ProductViewModel extends ChangeNotifier {
  final PorductRepo repo;

  ProductViewModel(this.repo) {
    print("loading this class");
    loadProduct();
  }
  bool isLoading = false;
  List<Product>? products;
  loadProduct() async {
    isLoading = true;
    notifyListeners();
    products = await repo.getProducts();
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    print("dispoe called");
    super.dispose();
  }
}
