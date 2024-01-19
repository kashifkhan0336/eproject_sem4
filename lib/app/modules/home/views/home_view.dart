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
        controller.getProducts(controller.presentation.value); // Call function to fetch more data
        controller.presentation.value=controller.presentation.value + 8;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Obx(
        () => GridView.builder(
          controller: _scrollController,
          cacheExtent: 20,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          padding: const EdgeInsets.all(5.0),
          itemCount:
              controller.products.length + 1, // Add 1 for loading indicator
          itemBuilder: (context, index) {
            if (index == controller.products.length) {
              return const Center(
                child: CircularProgressIndicator(), // Show loading indicator
              );
            }

            return Container(
                color: Colors.amber,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.addToWishlist(controller.products[index].id!);
                                },
                                icon: const Icon(Icons.heart_broken)),
                            IconButton(
                                onPressed: () {
                                  controller.addToCart(controller.products[index].id!);
                                },
                                icon: const Icon(Icons.add_shopping_cart))
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: controller.products[index].name!.length > 14
                              ? WatchName(index)
                              : WatchName(index))
                    ])); //         WatchName(index),, ) ], )
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
      // style: TextStyle(fontSize: 18.0, color: Colors.white),
    );
  }
}
