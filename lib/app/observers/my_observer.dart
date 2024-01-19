// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/modules/cart/controllers/cart_controller.dart';
import 'package:eproject_sem4/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
    print('Old route replace: ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print("didRemovee");
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    switch (route.settings.name) {
      case "CartView":
        Get.delete<CartController>();
        Get.lazyPut(() => CartController());
      case "WishlistView":
        Get.delete<WishlistController>();
        Get.lazyPut(() => WishlistController());
    }
    // TODO: implement didPop
    print("route popped!");
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
// class TextInput extends StatelessWidget {
//   final String inputPlaceholder;
//   final Icon inputIcon;
//   const TextInput({
//     super.key,
//     required this.inputPlaceholder,
//     required this.inputIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: inputPlaceholder,
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//         suffixIcon: inputIcon,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: BorderSide(color: Colors.grey, width: 2.0),
//         ),
//       ),
//     );
//   }
// }
// builder: (context, router) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Obx(() {
//         if (controller.isAuthenticated.isTrue) {
//           return Text(controller.email.value);
//         } else {
//           return Text("logout");
//         }
//       }),
//       actions: [
//         MaterialButton(
//           onPressed: () async {
//             await controller.signOut();
//           },
//           child: Icon(Icons.logout),
//         ),
//         MaterialButton(
//           onPressed: () {
//             context.router.pushNamed("/login");
//           },
//           child: Icon(Icons.verified_user),
//         )
//       ],
//       leading: MaterialButton(
//         onPressed: () {
//           context.router.pushNamed("/recover");
//         },
//         child: Icon(Icons.home),
//       ),
//     ),
//     body: router!,
//   );
// },
