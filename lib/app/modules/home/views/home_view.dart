import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/models/product.dart';

import 'package:eproject_sem4/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var list = [
  'Car',
  'Boat',
  'Plane',
];
Product _product = Product("Fawad GEl");
@RoutePage()
class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        padding: EdgeInsets.all(5.0), // padding around the grid
        itemCount: list.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue, // color of grid items
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index],
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  MaterialButton(onPressed: (){
                    context.router.push(ProductDetailView(product: _product));   
                  },child: Text("button"),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
