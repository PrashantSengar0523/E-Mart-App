import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shop/models/brand_model.dart';
import '../../shop/models/product_model.dart';

class BrandController extends GetxController {
  final CollectionReference<Map<String, dynamic>> _brandsRef = FirebaseFirestore.instance.collection('Brands');
  final CollectionReference<Map<String, dynamic>> _productsRef = FirebaseFirestore.instance.collection('Products');

  var brandList = <Brand>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    isLoading(true);
    try {
      final snapshot = await _brandsRef.get();
      if (snapshot.docs.isNotEmpty) {
        final brands = snapshot.docs.map((doc) {
          final data = doc.data();
          return Brand.fromMap(data, doc.id);
        }).toList();
        brandList.assignAll(brands);
      }
    } catch (e) {
      // Handle error
      print('Error fetching brands: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<List<Product>> getBrandProducts(String brandId) async {
    List<Product> products = [];
    try {
      final snapshot = await _productsRef.where('productBrand', isEqualTo: brandId).get();
      if (snapshot.docs.isNotEmpty) {
        products = snapshot.docs.map((doc) {
          final data = doc.data();
          return Product.fromMap(data, doc.id);
        }).toList();
      }
    } catch (e) {
      // Handle error
      print('Error fetching products for brand $brandId: $e');
    }
    return products;
  }
}
