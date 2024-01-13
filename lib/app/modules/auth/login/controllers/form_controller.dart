// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class LoginFormController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAuthSuccess = false.obs;
  RxString name = "Kashif".obs;
  final AuthService authService = Get.find();                                                                                                    

  Future<void> handleFormSubmission(Map<String, dynamic> formData) async {
    isLoading.value = true;
    try {
      final user = await authService.signIn(
          email: formData['email'],
          password: formData['password'],
          );

      if (user != null) {
        isAuthSuccess.value = true;
        // Authentication successful, proceed with the app logic
      } else {
        isAuthSuccess.value = false;
        // Authentication failed, show error message
      }
    } finally {
      isLoading.value = false;
    }
  }
}
