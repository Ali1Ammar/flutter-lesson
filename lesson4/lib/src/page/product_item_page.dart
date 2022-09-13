import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson4/src/data/product.dart';
import 'package:provider/provider.dart';

class ProudctItemPage extends StatelessWidget {
  const ProudctItemPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final item = context.read<Product>();
    return Scaffold(
      appBar: AppBar(),
      body: Text(item.description),
    );
  }
}
