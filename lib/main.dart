// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eproject_sem4/app/modules/auth/login/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/controllers/form_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app/modules/auth/register/controllers/form_controller.dart';
import 'app/routes/routes.dart';
import 'app/utils/init_services.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

final _router = AppRouter.router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterFormController());
        Get.lazyPut(() => LoginFormController());
        Get.lazyPut(() => RecoveryFormController());
      }),
    );
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
