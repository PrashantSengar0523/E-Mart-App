import 'package:e_mart/data/repositories/categories/category_repository.dart';
import 'package:e_mart/features/shop/models/category_model.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      //Show Loading
      isLoading.value = true;

      //Fetch Categories from data source(Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      //update category list
      allCategories.assignAll(categories);

      //filter featured category
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(6)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value=false;
    }
  }
}
