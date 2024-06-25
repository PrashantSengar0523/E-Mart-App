import 'dart:convert';

import 'package:e_mart/features/personalization/controllers/product_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/local_storage/storage_utility.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';



class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  void toggleFavouriteProduct(String productId) {
    // Check if the product ID is valid (e.g., alphanumeric)
    if (!RegExp(r'^[a-zA-Z0-9-_]+$').hasMatch(productId)) {
      TLoaders.customToast(message: 'Invalid product ID.');
      return;
    }

    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      TLoaders.customToast(message: 'Product has been added to Wishlist.');
    } else {
      favourites.remove(productId);
      TLoaders.customToast(message: 'Product has been removed from Wishlist.');
    }
    saveFavouritesToStorage();
    favourites.refresh();
  }

  Future<List<Product>> favouriteProduct() async {
    final productIds = favourites.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
    print('Original Product IDs: $productIds'); // Debugging line

    
    return await ProductController.instance.getFavouriteProduct(productIds);
  }
}
