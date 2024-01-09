// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eproject_sem4/app/modules/auth/register/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterFormController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Form Example1'),
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(children: [
              FormBuilderTextField(
                name: "full_name",
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required()]),
              ),
              const SizedBox(
                height: 10,
              ),
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
              FormBuilderTextField(
                name: 'confirm_password',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: (_formKey.currentState?.fields['confirm_password']
                              ?.hasError ??
                          false)
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(Icons.check, color: Colors.green),
                ),
                obscureText: true,
                validator: (value) =>
                    _formKey.currentState?.fields['password']?.value != value
                        ? 'No coinciden'
                        : null,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState?.value;
                    if (formData != null) {
                      controller.checkEmailExists(formData['email']);
                      if(controller.emailExists.isTrue){
                        _emailFieldKey.currentState?.invalidate('Email already taken');
                      }
                      await controller.handleFormSubmission(formData);
                      debugPrint(formData.toString());
                    }
                  }
                },
                child: Obx(() {
                  return controller.isLoading.value
                      ? CircularProgressIndicator() // Show loading indicator
                      : Text("Register");
                }),
              )
            ]),
          ),
        ));
  }
}
