// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';
import 'package:eproject_sem4/app/modules/auth/login/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/cart/controllers/cart_controller.dart';
import 'package:eproject_sem4/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:eproject_sem4/app/routes/routes.gr.dart';
import 'package:eproject_sem4/app/utils/init_controllers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/modules/auth/register/controllers/form_controller.dart';
import 'app/observers/my_observer.dart';
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
      if (event == null) {
        _router.pushNamed("/login");
      }
    });
    return MaterialApp.router(
        routerConfig: _router.config(
            reevaluateListenable:
                ReevaluateListenable.stream(_supabase.auth.onAuthStateChange),
            navigatorObservers: () => [MyObserver()]));
  }
}
