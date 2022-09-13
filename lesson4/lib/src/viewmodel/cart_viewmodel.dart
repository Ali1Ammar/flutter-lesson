import 'package:flutter/material.dart';
import 'package:lesson4/src/data/product.dart';

class CartViewModel extends ChangeNotifier {
  final _set = <Product>{};
  List<Product> get proudct {
    return _set.toList();
  }

  int get length => _set.length;

  void addProudct(Product item) {
    _set.add(item);
    notifyListeners();
  }

  void removeProudct(Product item) {
    _set.remove(item);
    notifyListeners();
  }

  bool contain(Product item) => _set.contains(item);

  void toggleItem(Product item) {
    if (contain(item)) {
      removeProudct(item);
    } else {
      addProudct(item);
    }
  }
}
