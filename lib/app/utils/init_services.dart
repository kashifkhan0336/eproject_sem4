// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/main.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  print('starting services ...');
  Get.lazyPut<AuthService>(() => AuthService());
  print('All services started...');
}
