import 'package:get/get.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  var cartItems = <CartModel>[].obs;

  // Add an item to the cart
 void addItem(CartModel item) {
  print('Adding item to cart: ${item.productId}, Quantity: ${item.quantity}');
  var existingItem = cartItems.firstWhereOrNull((cartItem) =>
      cartItem.productId == item.productId &&
      cartItem.variationId == item.variationId);
  if (existingItem != null) {
    existingItem.quantity += item.quantity;
    cartItems.refresh(); // Refresh the reactive list
    print('Item quantity updated: ${existingItem.productId}, New Quantity: ${existingItem.quantity}');
  } else {
    cartItems.add(item);
    print('New item added to cart: ${item.productId}');
  }
}





  // Remove an item from the cart
  void removeItem(CartModel item) {
    cartItems.remove(item);
  }

  // Clear all items from the cart
  void clearCart() {
    cartItems.clear();
  }

  // Get total quantity of items in the cart
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Get total price of items in the cart
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  // Increase quantity of a specific item
  void increaseQuantity(CartModel item) {
    var index = cartItems.indexOf(item);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  // Decrease quantity of a specific item
  void decreaseQuantity(CartModel item) {
    var index = cartItems.indexOf(item);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }
}
