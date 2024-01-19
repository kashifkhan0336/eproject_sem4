import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/data/services/cart_service.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';
import 'package:eproject_sem4/app/data/services/wishlist_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController{
  final _wishlistService = Get.find<WishlistService>();
  final _cartService = Get.find<CartService>();
  RxInt presentation = 8.obs;
  @override
  void onReady() {
    print("HomeController ready!");
    // TODO: implement onReady
    getProducts(8);
    super.onReady();
  }
  final ProductService _productService = Get.find<ProductService>();
  final products = <Product>[].obs;
  Future<void> getProducts(int limit)async{
    print("getProducts function called!");
    products.value = await _productService.getProducts(limit: limit);
  }
  Future<void> addToWishlist(int watchId)async{
    await _wishlistService.addWishlistItem(watchId);
    print("Item added to wishlist");
  }
  Future<void> addToCart(int watchId)async{
    await _cartService.addCartItem(watchId);
    print("Item added to cart");
  }
}