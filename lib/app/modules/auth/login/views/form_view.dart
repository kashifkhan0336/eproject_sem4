// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/modules/auth/login/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginFormController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
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
              FormBuilderTextField(
                key: _passwordFieldKey,
                name: 'password',
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
              ),

              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;
                    if (formData != null) {
                      await controller.handleFormSubmission(formData);
                      if(controller.isAuthSuccess.isFalse){
                        _emailFieldKey.currentState?.invalidate('Bad email/password');
                        _passwordFieldKey.currentState?.invalidate('Bad email/password');
                      }
                      debugPrint(formData.toString());
                    }
                  }
                },
                child: Obx(() {
                  return controller.isLoading.value
                      ? CircularProgressIndicator() // Show loading indicator
                      : Text("Login");
                }),
              )
            ]),
          ),
        ));
  }
}
