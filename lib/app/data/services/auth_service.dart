// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final SupabaseClient _supabase = SupabaseClient(
      "https://myzerqoresebhflccfvz.supabase.co",
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im15emVycW9yZXNlYmhmbGNjZnZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQzNDAwNTMsImV4cCI6MjAxOTkxNjA1M30.9vLHJVrr6XYzXkfJT1EX3nvLFYiHICdjRrpz4Zlf5fU",
      authOptions: AuthClientOptions(authFlowType: AuthFlowType.implicit));
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      print(response);
      return response.user;
    } on AuthException {
      return null;
    }
  }

  Future<bool> isEmailExists(String email) async {
    final response = await _supabase.rpc('email_exists',
        params: {"email_address": email});

    return response;
  }
  Future<void> resetPassword(String email) async{
    final response = await _supabase.auth.resetPasswordForEmail(email);
    return response;
  }
  Future<User?> signUp(
      {required String email,
      required String password,
      required String fullName}) async {
    final response = await _supabase.auth.signUp(
        email: email, password: password, data: {"full_name": fullName});
    print(response);
    return response.user;
  }
}
