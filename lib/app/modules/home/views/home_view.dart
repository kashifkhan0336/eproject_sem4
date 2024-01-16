import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/modules/home/controllers/home_controller.dart';

import 'package:eproject_sem4/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var list = [
  'Car',
  'Boat',
  'Plane',
];


@RoutePage()
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Fetch more data here
        print("scroll");
      }
    });
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Obx(
        () => GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          padding: EdgeInsets.all(5.0), // padding around the grid
          itemCount: controller.products.length, // total number of items
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue, // color of grid items
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.products[index].name!.length > 14)
                      WatchName(index),
                    MaterialButton(
                      onPressed: () {
                        context.router.push(ProductDetailView(
                            product: controller.products[index]));
                      },
                      child: Text("button"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

Text WatchName(int index) {
 String productName = controller.products[index].name!;
 String displayedName = productName.length > 14
     ? "${productName.substring(0, 14)}..."
     : productName;

 return Text(
   displayedName,
   style: TextStyle(fontSize: 18.0, color: Colors.white),
 );
}

}
