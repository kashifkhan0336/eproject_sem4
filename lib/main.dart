// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';
import 'package:eproject_sem4/app/modules/auth/login/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:eproject_sem4/app/routes/routes.gr.dart';
import 'package:eproject_sem4/app/utils/init_controllers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/auth/register/controllers/form_controller.dart';
import 'app/routes/routes.dart';
import 'app/utils/init_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await initControllers();
  final ProductService _productService = Get.find();
  final _supabase = Get.find<SupabaseClient>();
  final _storage = Get.find<FlutterSecureStorage>();
  if (await _storage.containsKey(key: "user_session")) {
 
    final session_string = await _storage.read(key: "user_session");

    //print(session_string);
    
    try {
      await _supabase.auth.recoverSession(session_string!);
         print("Already logged in!");
      print("Session recovered!");
    } on AuthException {
      await _storage.delete(key: "user_session");
    }
  }

  runApp(MyApp());
}

class AppBarController extends GetxController {

  RxString appBarTitle = "WatchHub".obs;
  
}

final _router = AppRouter();

class MyApp extends GetView<AppBarController> {
  final AuthService authService = Get.find();
    final _supabase = Get.find<SupabaseClient>();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    authService.userStream.listen((event) {
      print("Something changed!");
      if(event == null){
        _router.pushNamed("/login");
      }
    });
    return MaterialApp.router(
      routerConfig: _router.config(
        reevaluateListenable: ReevaluateListenable.stream(_supabase.auth.onAuthStateChange),
        navigatorObservers: () => [MyObserver()]
      )
    );
  }
}
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
    // TODO: implement didPop
    Get.delete<WishlistController>();
    Get.lazyPut(()=>WishlistController());
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