import 'package:flutter/material.dart';
import 'package:lesson4/src/page/cart_page.dart';
import 'package:lesson4/src/viewmodel/cart_viewmodel.dart';
import 'package:lesson4/src/widget/proudct_widget.dart';
import 'package:provider/provider.dart';

import '../viewmodel/product_viewmodel.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductViewModel(context.read()),
        builder: (context, _) {
          final viewModel = context.watch<ProductViewModel>();
          final cartViewModel = context.watch<CartViewModel>();
          return Scaffold(
            appBar: AppBar(
              title: const Text("product"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CartPage();
                      }));
                    },
                    icon: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(cartViewModel.length.toString())),
                        Center(child: Icon(Icons.shopify_sharp))
                      ],
                    ))
              ],
            ),
            body: viewModel.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: [
                      if (viewModel.products == null)
                        Text("no data")
                      else
                        for (final item in viewModel.products!)
                          ProudctItemWidget(item: item)
                    ],
                  ),
          );
        });
  }
}
