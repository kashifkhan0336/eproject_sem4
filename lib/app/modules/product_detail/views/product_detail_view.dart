import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class ProductDetailView extends GetView {
  const ProductDetailView({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(product.description!);
  }
}

