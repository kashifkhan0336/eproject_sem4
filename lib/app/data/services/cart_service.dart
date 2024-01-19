import 'package:eproject_sem4/app/data/models/cart_item.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_service.dart';

class CartService extends GetxService {
  final _supabaseClient = Get.find<SupabaseClient>();
  final _authService = Get.find<AuthService>();
  int currentCartId = 0;
  @override
  Future<void> onReady() async {
    print("Cart service ready!");
    final userId = _authService.currentUser()?.id;
    if (userId != null) {
      try {
        final currentCart = await _supabaseClient
            .from("carts")
            .select("id")
            .eq("user_id", userId)
            .single();
        currentCartId = currentCart['id'];
      } on PostgrestException {
        final result = await _supabaseClient
            .from("carts")
            .insert({"user_id": userId}).select();
        currentCartId = result[0]["id"];
        print("New Cart created with ID: $currentCartId");
      }
    } else {
      print("user not logged in");
    }

    // print(await getQuantity(128));
    // print("decrease");
    // await decreaseCartItemQuantity(128);
    // print(await getQuantity(128));
  }

  Future<void> addCartItem(int watchId, {int quantity = 1}) async {
    final cartId = currentCartId;
    print(cartId);
    final result = await _supabaseClient.from("cart_items").insert({
      "cart_id": cartId,
      "watch_id": watchId,
      "quantity": quantity
    }).select();

    print(result);
  }

  Future<void> deleteCartItem(int watchId) async {
    final result = await _supabaseClient
        .from("cart_items")
        .delete()
        .eq("cart_id", currentCartId)
        .eq("watch_id", watchId)
        .select();

    print(result);
  }

  Future<List<CartItem>> getAllCartItems() async {
    List<CartItem> response = await _supabaseClient
        .from("cart_items")
        .select(
            "id,quantity,watches (id,watch_data->name,watch_data->price,watch_data->description,watch_data->images,watch_data->specs,brands (name))")
        .eq("cart_id", currentCartId)
        .withConverter(
            (cartItems) => cartItems.map(CartItem.fromJson).toList());
    return response;
  }
  Future<CartItem> getCartItem(int watchId)async{
    CartItem response = await _supabaseClient
      .from("cart_items")
      .select(
            "id,quantity,watches (id,watch_data->name,watch_data->price,watch_data->description,watch_data->images,watch_data->specs,brands (name))")
            .eq("cart_id", currentCartId).eq("watch_id", watchId)
            .single().withConverter((data) => CartItem.fromJson(data));

      return response;

  }
  Future<void> increaseCartItemQuantity(int watchId) async {

    final currentQuantity = await getQuantity(watchId);
    final result = await _supabaseClient
        .from("cart_items")
        .update({"quantity": currentQuantity+1})
        .eq("cart_id", currentCartId)
        .eq("watch_id", watchId);

    print(result);
  }
    Future<void> decreaseCartItemQuantity(int watchId) async {
    final currentQuantity = await getQuantity(watchId);
    if(currentQuantity > 1) {
      final result = await _supabaseClient
        .from("cart_items")
        .update({"quantity": currentQuantity-1})
        .eq("cart_id", currentCartId)
        .eq("watch_id", watchId)
        .select();
      
    print(result);
    }else{
      print("can't decrease any further");
    }

  }
  Future<int> getQuantity(int watchId) async {
    final response = await _supabaseClient
        .from("cart_items")
        .select("quantity")
        .eq("cart_id", currentCartId)
        .eq("watch_id", watchId);
    final quantity = response[0]["quantity"];
    return quantity;
  }
}

// ... (existing code for Product, Brands, and Image classes)
