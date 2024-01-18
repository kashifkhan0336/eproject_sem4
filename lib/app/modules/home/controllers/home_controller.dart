import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/data/services/product_service.dart';
import 'package:eproject_sem4/app/data/services/wishlist_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController{
  final _wishlistService = Get.find<WishlistService>();
  RxInt presentation = 5.obs;
  @override
  void onReady() {
    print("HomeController ready!");
    // TODO: implement onReady
    getProducts();
    super.onReady();
  }
  final ProductService _productService = Get.find<ProductService>();
  final products = <Product>[].obs;
  Future<void> getProducts()async{
    print("getProducts function called!");
    products.value = await _productService.getProducts();
  }
  Future<void> addToWishlist(int watchId)async{
    await _wishlistService.addWishlistItem(watchId);
    print("Item added to wishlist");
  }
}