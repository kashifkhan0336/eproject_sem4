// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:eproject_sem4/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final Rxn<User?> _user = Rxn<User>();
  Stream<User?> get userStream => _user.stream;
  // RxBool isAuth = false.obs;

  final _supabase = Get.find<SupabaseClient>();
  final _storage = Get.find<FlutterSecureStorage>();

  @override
  Future<void> onReady() async {
    _supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final session = data.session;
      if (event == AuthChangeEvent.signedIn) {
        _user.value = session?.user;
        print("Signin called from auth service");
      }
      if (event == AuthChangeEvent.signedOut) {
        print("Signout called from auth service");
        _user.value = null;
      }
    });
  }
  // Rxn<User?> get userStream => _user;
  // bool get getIsAuth => isAuth.value;
  // @override
  // Future<void> onReady() async {
  //   _supabase.auth.onAuthStateChange.listen((data) async {
  //     final AuthChangeEvent event = data.event;
  //     if (event == AuthChangeEvent.signedIn) {
  //       print("SignedIn happend! saving session state");
  //       notifyListeners();
  //       isAuth.value = true;
  //       // Get user session information
  //       final session = data.session;
  //       _user.value = session?.user;
  //       // Convert session to a string (assuming it's a JSON-serializable object)
  //       final sessionString = jsonEncode(session!);
  //       //_supabase.auth.recoverSession(sessionString);

  //       await _storage.write(key: "user_session", value: sessionString);
  //       // await _storage.write(key: "user_session", value: data.session.user);
  //       // handle signIn
  //     }
  //     if (event == AuthChangeEvent.signedOut) {
  //       print("Signed out!");
  //       _user.value = null;
  //       isAuth.value = false;
  //       notifyListeners();
  //       await _storage.delete(key: "user_session");
  //     }
  //     if (event == AuthChangeEvent.tokenRefreshed) {
  //       print("Session Initialized!");
  //       notifyListeners();
  //       isAuth.value = true;
  //       final session = data.session;
  //       _user.value = session?.user;
  //       // Convert session to a string (assuming it's a JSON-serializable object)
  //       final sessionString = jsonEncode(session!);
  //       //_supabase.auth.recoverSession(sessionString);

  //       await _storage.write(key: "user_session", value: sessionString);
  //     }
  //   });
  // }

  // final SupabaseClient _supabase = SupabaseClient(
  //     "https://myzerqoresebhflccfvz.supabase.co",
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im15emVycW9yZXNlYmhmbGNjZnZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQzNDAwNTMsImV4cCI6MjAxOTkxNjA1M30.9vLHJVrr6XYzXkfJT1EX3nvLFYiHICdjRrpz4Zlf5fU",
  //     authOptions: AuthClientOptions(authFlowType: AuthFlowType.implicit));
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _supabase.auth
          .signInWithPassword(email: email, password: password);
      return response.user;
    } on AuthException {
      return null;
    }
  }

  Future<bool> isAuth() async {
    try {
      await _supabase.auth.getUser();
      return true;
    } on AuthException {
      return false;
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut(scope: SignOutScope.global);
  }
  // Future<User?> getUser() async {
  //   final user = _supabase.auth.currentUser;
  //   return user;
  // }

  // Future<bool> isAuthenticated() async {
  //   final user = _supabase.auth.currentUser;

  //   // Return true if the user is authenticated, false otherwise
  //   return user != null;
  // }

  Future<bool> isEmailExists(String email) async {
    final response =
        await _supabase.rpc('email_exists', params: {"email_address": email});

    return response;
  }

  Future<void> resetPassword(String email) async {
    final response = await _supabase.auth.resetPasswordForEmail(email);
    return response;
  }

  Future<User?> signUp(
      {required String email,
      required String password,
      required String fullName}) async {
    final response = await _supabase.auth.signUp(
        email: email, password: password, data: {"full_name": fullName});
    //print(response);
    return response.user;
  }
}
