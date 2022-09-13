import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson4/src/viewmodel/cart_viewmodel.dart';
import 'package:provider/provider.dart';

import '../widget/proudct_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartViewModel viewModel = context.watch();
    final products = viewModel.proudct;
    return Scaffold(
      appBar: AppBar(title: Text("cart items")),
      body: ListView.builder(
          itemCount: viewModel.length,
          itemBuilder: (context, i) {
            final item = products[i];
            return ProudctItemWidget(item: item);
          }),
    );
  }
}
