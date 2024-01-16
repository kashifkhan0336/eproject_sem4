
import 'package:eproject_sem4/app/data/models/wishlist_item.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WishlistService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();
  final _authService = Get.find<AuthService>();
  int currentWishlistId = 0;

  @override
  Future<void> onReady() async {
    print("Wishlist controller ready!");
    final userId = _authService.currentUser()?.id;

    // Fetch and store the current wishlist ID
    final currentWishlist = await _supabaseClient
        .from("wishlists")
        .select("id")
        .eq("user_id", userId!)
        .single();
    currentWishlistId = currentWishlist["id"];
  }

  Future<void> addWishlistItem(int watchId) async {
    final wishlistId = currentWishlistId;

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

  Future<List<WishlistItem>> getAllWishlistItems() async {
    final wishlistId = currentWishlistId;

    final response = await _supabaseClient
        .from("wishlist_items")
        .select()
        .eq("wishlist_id", wishlistId);

    final wishlistItems =
        (response).map((item) => WishlistItem.fromJson(item)).toList();

    return wishlistItems;
  }
}
