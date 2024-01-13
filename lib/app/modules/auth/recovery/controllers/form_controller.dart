// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class RecoveryFormController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAuthSuccess = false.obs;


  Future<void> handleFormSubmission(Map<String, dynamic> formData) async {
    isLoading.value = true;
    try {
      //await authService.resetPassword(formData["email"]);

    } finally {
      isLoading.value = false;
    }
  }
}
