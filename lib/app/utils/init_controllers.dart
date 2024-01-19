// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/modules/auth/login/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/auth/register/controllers/form_controller.dart';
import 'package:eproject_sem4/app/modules/cart/controllers/cart_controller.dart';
import 'package:eproject_sem4/app/modules/home/controllers/home_controller.dart';
import 'package:eproject_sem4/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:eproject_sem4/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../adapters/flutter_secure_storage_adapter.dart';
AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

Future<void> initControllers() async {
  print('starting controllers ...');
  Get.lazyPut(() => AppBarController());
    Get.lazyPut<FlutterSecureStorage>(
      () => FlutterSecureStorage(aOptions: _getAndroidOptions()));
    final _storage = Get.find<FlutterSecureStorage>();
  Get.lazyPut<SupabaseClient>(() => SupabaseClient(
        "https://myzerqoresebhflccfvz.supabase.co",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im15emVycW9yZXNlYmhmbGNjZnZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQzNDAwNTMsImV4cCI6MjAxOTkxNjA1M30.9vLHJVrr6XYzXkfJT1EX3nvLFYiHICdjRrpz4Zlf5fU",
        authOptions: AuthClientOptions(authFlowType: AuthFlowType.pkce, pkceAsyncStorage: FlutterSecureStorageAdapter())
      ));

  Get.lazyPut(() => RegisterFormController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => LoginFormController());
  Get.lazyPut(() => RecoveryFormController());
  Get.lazyPut(()=>CartController());
  Get.lazyPut(()=>WishlistController());
  print('All controllers initialized...');
}
