import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/models/product.dart';
import 'package:eproject_sem4/app/data/services/wishlist_service.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final _wishlistService = Get.find<WishlistService>();
  final wishlistItems = <Product>[].obs;
  @override
  Future<void> onReady() async {
    print("wishlist controller ready!");
    
    // TODO: implement onReady
    await getAllWishlistItems();

    super.onReady();
  }
  @override
  void onClose(){
    
  }
  Future<void> removeItem(int watchId)async{
    await _wishlistService.deleteWishlistItem(watchId);
    await getAllWishlistItems();
  }
  Future<void> getAllWishlistItems()async{
    wishlistItems.value = await _wishlistService.getAllWishlistItems();
  }
}
