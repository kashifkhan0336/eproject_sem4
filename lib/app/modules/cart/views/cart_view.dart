import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
@RoutePage()
class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
        return Obx(() {
      return controller.isLoading.value
          ? CircularProgressIndicator()
          : CartItems(controller: controller);
    });
  }
}
class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.controller,
  });

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
      itemCount: controller.cartItems.length,
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
                    child: Text(controller.cartItems[index].watches!.name!),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await controller
                              .deleteCartItem(controller.cartItems[index].watches!.id!);
                          print("item removed!");
                        },
                        child: Text("remove"),
                      ),
                                            MaterialButton(
                        onPressed: () async {
                          await controller
                              .increaseCartItemQuantity(controller.cartItems[index].watches!.id!);
                          print("increase quantity!");
                        },
                        child: Text("increase"),
                      ),
                                            MaterialButton(
                        onPressed: () async {
                          await controller
                              .decreaseCartItemQuantity(controller.cartItems[index].watches!.id!);
                          print("decrease quantity!");
                        },
                        child: Text("decrease"),
                      ),
                      Text(controller.cartItems[index].quantity!.toString())
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}