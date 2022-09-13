import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson4/src/data/product.dart';
import 'package:provider/provider.dart';

import '../page/product_item_page.dart';
import '../viewmodel/cart_viewmodel.dart';

class ProudctItemWidget extends StatelessWidget {
  final Product item;
  const ProudctItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.watch<CartViewModel>();
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Provider.value(
                value: item,
                child: ProudctItemPage(),
              );
            }));
          },
          title: Text(item.title),
          leading: IconButton(
              onPressed: () {
                cartViewModel.toggleItem(item);
              },
              icon: cartViewModel.contain(item)
                  ? Icon(Icons.remove)
                  : Icon(Icons.add)),
        ),
        Image.network(
          item.image,
          height: 150,
        ),
        Divider(
          thickness: 5,
        )
      ],
    );
  }
}
