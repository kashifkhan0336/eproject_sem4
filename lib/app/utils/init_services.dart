// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync<AuthService>(() async => AuthService());
  print('All services started...');
}
