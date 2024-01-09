// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool emailExists = false.obs;
  final AuthService authService = Get.find();                                                                                                    
   Future<void> checkEmailExists(String email) async {
    try {
      bool result = await authService.isEmailExists(email);

      // Assuming result is a bool, update state
      emailExists.value = result;
    } catch (error) {
      // Handle errors, log them, or update state accordingly
      print("Error checking email existence: $error");
      // For diagnostic purposes, you might set emailExists to false in case of an error
      emailExists.value = false;
    }
  }

  Future<void> handleFormSubmission(Map<String, dynamic> formData) async {
    isLoading.value = true;
    try {
      final user = await authService.signUp(
          email: formData['email'],
          password: formData['password'],
          fullName: formData['full_name']);
      print(user);

      if (user != null) {
        print("registered");
        // Authentication successful, proceed with the app logic
      } else {
        print("registration failed!");
        // Authentication failed, show error message
      }
    } finally {
      isLoading.value = false;
    }
  }
}
