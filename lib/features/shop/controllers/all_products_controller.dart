import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    double getEffectivePrice(ProductModel product) {
      // Use sale price if available, otherwise normal price
      return product.salePrice > 0 ? product.salePrice : product.price;
    }

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Higher Price':
        products.sort((a, b) => getEffectivePrice(b).compareTo(getEffectivePrice(a)));
        break;

      case 'Lower Price':
        products.sort((a, b) => getEffectivePrice(a).compareTo(getEffectivePrice(b)));
        break;

      case 'Newest':
        products.sort((a, b) => (b.date ?? DateTime(0)).compareTo(a.date ?? DateTime(0)));
        break;

      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0 && a.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (b.salePrice > 0) {
            return 1; // b comes first
          } else if (a.salePrice > 0) {
            return -1; // a comes first
          } else {
            return 0;
          }
        });
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }

    // Important: refresh so UI updates
    products.refresh();
  }


  void assignProducts(List<ProductModel> products) {
    // Assign  products to the 'products' list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}