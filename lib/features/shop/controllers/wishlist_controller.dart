import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = <String>[].obs;

  void addToWishlist(String productTitle) {
    if (!wishlist.contains(productTitle)) {
      wishlist.add(productTitle);
    }
  }

  void removeFromWishlist(String productTitle) {
    wishlist.remove(productTitle);
  }

  bool isInWishlist(String productTitle) {
    return wishlist.contains(productTitle);
  }
}
