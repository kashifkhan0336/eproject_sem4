// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FlutterSecureStorageAdapter implements GotrueAsyncStorage {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Future<void> setItem({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<String?> getItem({required String key}) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> removeItem({required String key}) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }
}
