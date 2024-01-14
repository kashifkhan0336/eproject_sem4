import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class RootView extends GetView {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("WatchHub"),
            leading: MaterialButton(
                onPressed: () {
                  context.router.pushNamed("/home");
                },
                child: Icon(Icons.home)),
            actions: [
              MaterialButton(
                onPressed: () async {
                  final AuthService authService = Get.find();
                  await authService.signOut();
                },
                child: Icon(Icons.logout),
              ),
              MaterialButton(
                onPressed: () async {
                  context.router.pushNamed("recover");
                },
                child: Icon(Icons.folder),
              )
            ],
          ),
          body: AutoRouter()),
    );
  }
}
