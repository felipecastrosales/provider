import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.read<ProductModel>().name);
  }
}
