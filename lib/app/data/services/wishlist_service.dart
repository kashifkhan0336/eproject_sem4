import 'dart:convert';

import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/data/models/wishlist_item.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
List<Map<String, dynamic>> removeWatchesKey(List<Map<String, dynamic>> data) {
 return data.map((item) => item['watches'] as Map<String, dynamic>).toList();
}

class WishlistService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();
  final _authService = Get.find<AuthService>();
  int currentWishlistId = 0;

  @override
  Future<void> onReady() async {
    print("Wishlist service ready!");
    final userId = _authService.currentUser()?.id;
    if (userId != null) {
      try{
              final currentWishlist = await _supabaseClient
          .from("wishlists")
          .select("id")
          .eq("user_id", userId)
          .single();
          currentWishlistId = currentWishlist['id'];
      }on PostgrestException{
                final result = await _supabaseClient
            .from("wishlists")
            .insert({"user_id": userId}).select();
        currentWishlistId = result[0]["id"];
        print("New wishlist created with ID: $currentWishlistId");
      }
      // currentWishlistId = currentWishlist["id"];
    } else {
      print("user not logged in");
    }

        final response = await _supabaseClient
        .from("wishlist_items")
        .select("watches (id,watch_data->name,watch_data->price,watch_data->description,watch_data->images,watch_data->specs,brands (name))")
        .eq("wishlist_id", currentWishlistId);
    // Fetch and store the current wishlist ID
  }

  Future<void> addWishlistItem(int watchId) async {
    final wishlistId = currentWishlistId;
    print(wishlistId);
    final result = await _supabaseClient
        .from("wishlist_items")
        .insert({"wishlist_id": wishlistId, "watch_id": watchId}).select();

    print(result);
  }

  Future<void> deleteWishlistItem(int watchId) async {
    final result = await _supabaseClient
        .from("wishlist_items")
        .delete()
        .eq("wishlist_id", currentWishlistId)
        .eq("watch_id", watchId);

    print(result);
  }

  Future<List<Product>> getAllWishlistItems() async {
    final wishlistId = currentWishlistId;

    final response = await _supabaseClient
        .from("wishlist_items")
        .select("watches (id,watch_data->name,watch_data->price,watch_data->description,watch_data->images,watch_data->specs,brands (name))")
        .eq("wishlist_id", currentWishlistId);

    // final wishlistItems =
    //     (response).map((item) => WishlistItem.fromJson(item)).toList();
    // print(wishlistItems);
    return removeWatchesKey(response).map((w) => Product.fromJson(w)).toList();
  }
}
