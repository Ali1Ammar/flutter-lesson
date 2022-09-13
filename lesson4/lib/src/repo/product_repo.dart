import 'package:lesson4/src/data/product.dart';
import 'package:dio/dio.dart';

class PorductRepo {
  final dio = Dio()..options.baseUrl = "https://fakestoreapi.com/";
  Future<List<Product>> getProducts() async {
    var response = await dio.get('products');
    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
