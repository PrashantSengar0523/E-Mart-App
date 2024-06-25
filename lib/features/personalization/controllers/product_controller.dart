import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/utils/Exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/Exceptions/firebase_exception.dart';
import '../../shop/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final CollectionReference<Map<String, dynamic>> _productsRef = FirebaseFirestore.instance.collection('Products');

  var productList = <Product>[].obs;
  var selectedSortingOption = 'Name'.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    try {
      final snapshot = await _productsRef.get();
      if (snapshot.docs.isNotEmpty) {
        final products = snapshot.docs.map((doc) {
          final data = doc.data();
          return Product.fromMap(data, doc.id);
        }).toList();
        productList.assignAll(products);
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    }on PlatformException catch (e) {
      throw TPlatformException(e.code);
    }catch (e) {
      throw 'something went wrong';
    } finally {
      isLoading(false);
    }
  }

  void updateSortingOption(String newOption) {
    selectedSortingOption.value = newOption;
    sortProducts();
  }

  void sortProducts() {
    switch (selectedSortingOption.value) {
      case 'Name':
        productList.sort((a, b) => a.productTitle.compareTo(b.productTitle));
        break;
      case 'Higher Price':
        productList.sort((a, b) => double.parse(b.productPrice).compareTo(double.parse(a.productPrice)));
        break;
      case 'Lower Price':
        productList.sort((a, b) => double.parse(a.productPrice).compareTo(double.parse(b.productPrice)));
        break;
      case 'Sale':
        productList.sort((a, b) {
          if (b.saleText.isNotEmpty && a.saleText.isNotEmpty) {
            return double.parse(b.saleText).compareTo(double.parse(a.saleText));
          } else if (b.saleText.isNotEmpty) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      case 'Popular':
        productList.sort((a, b) => b.productRating.compareTo(a.productRating));
        break;
      default:
        productList.sort((a, b) => a.productTitle.compareTo(b.productTitle));
        break;
    }
  }

  void updateProductList(List<Product> products, {String? brandName}) {
    if (brandName != null) {
      products = products.where((product) => product.productBrand == brandName).toList();
    }
    productList.assignAll(products);
    sortProducts();
  }

  Future<List<Product>> getFavouriteProduct(List<String> productIds) async {
    print('Fetching favorite products with IDs: $productIds');
    try {
      isLoading(true);
      if (productIds.isEmpty) {
        return [];
      }
      final snapshot = await _productsRef.where(FieldPath.documentId, whereIn: productIds).get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return Product.fromMap(data, doc.id);
        }).toList();
      }
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.code}');
      throw TFirebaseException(e.code);
    } on PlatformException catch (e) {
      print('PlatformException: ${e.code}');
      throw TPlatformException(e.code);
    } catch (e) {
      print('Exception: $e');
      throw 'something went wrong';
    } finally {
      isLoading(false);
    }
    return [];
  }
}