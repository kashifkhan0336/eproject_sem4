import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

@RoutePage()
class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? CircularProgressIndicator()
          : WishlistItems(controller: controller);
    });
  }
}

class WishlistItems extends StatelessWidget {
  const WishlistItems({
    super.key,
    required this.controller,
  });

  final WishlistController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      ListView.builder(
        itemCount: controller.wishlistItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(controller.wishlistItems[index].name!),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await controller
                            .removeItem(controller.wishlistItems[index].id!);
                        print("item removed!");
                      },
                      child: Text("remove"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
  );
  }
}
