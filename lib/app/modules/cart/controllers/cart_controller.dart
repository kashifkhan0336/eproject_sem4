import 'package:eproject_sem4/app/data/models/cart_item.dart';
import 'package:eproject_sem4/app/data/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final _cartService = Get.find<CartService>();
  final cartItems = <CartItem>[].obs;
    final isLoading = true.obs;
  @override
  Future<void> onReady() async {
    print("Cart Controller ready!");
    await getAllCartItems();
    print(cartItems);
    isLoading.value = false;
    
  }
  Future<void> getAllCartItems()async{
    
    cartItems.value = await _cartService.getAllCartItems();

  }
  Future<void> deleteCartItem(int watchId)async{
    await _cartService.deleteCartItem(watchId);
    await getAllCartItems();
  }
  Future<void> increaseCartItemQuantity(int watchId)async{
    await _cartService.increaseCartItemQuantity(watchId);
    int index = cartItems.indexWhere((element) => element.watches!.id == watchId);
    // cartItems[index].quantity = cartItems[index].quantity! + 1;
    // cartItems.refresh();
    final item = await _cartService.getCartItem(watchId);
    cartItems[index] = item;
    cartItems.refresh();
    print(item.watches!.name);
  }
    Future<void> decreaseCartItemQuantity(int watchId)async{
    await _cartService.decreaseCartItemQuantity(watchId);
    int index = cartItems.indexWhere((element) => element.watches!.id == watchId);
    // cartItems[index].quantity = cartItems[index].quantity! + 1;
    // cartItems.refresh();
    final item = await _cartService.getCartItem(watchId);
    cartItems[index] = item;
    cartItems.refresh();
    print(item.watches!.name);
  }
  // Future<int> getQuantity(int watchId)async{

  // }
}