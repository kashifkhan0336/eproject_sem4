// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

@RoutePage()
class RecoveryView extends GetView<RecoveryFormController> {
  const RecoveryView({super.key});
  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Dialog'),
        content: const Text('This is a dialog'),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(children: [
              FormBuilderTextField(
                key: _emailFieldKey,
                name: "email",
                decoration: const InputDecoration(labelText: "Email"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  final currentContext = context;
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;
                    if (formData != null) {
                      await controller.handleFormSubmission(formData);
                      // if(controller.isAuthSuccess.isFalse){
                      //   _emailFieldKey.currentState?.invalidate('Bad email/password');
                      //   _passwordFieldKey.currentState?.invalidate('Bad email/password');
                      // }
                      //openDialog();
                      showDialog(
                        context: currentContext,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Success"),
                            content: Text("Password reset email sent!"),
                          );
                        },
                      );
                      debugPrint(formData.toString());
                    }
                  }
                },
                child: Obx(() {
                  return controller.isLoading.value
                      ? CircularProgressIndicator() // Show loading indicator
                      : Text("Request");
                }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
