import 'package:get/get.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  /// Variables
  final RxBool isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> fetchFeaturedBrands ()async {
    try {
      // Start Loaders
      isLoading.value = true;

      // fetch brands
      final brands = await brandRepository.getAllBrands();

      // Assign All The Brands
      allBrands.assignAll(brands);

      // assign featured brands
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    } finally {
      // Stop Loaders
      isLoading.value = false;
    }
  }

  /// -- Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory (String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// -- Get Brand Specific Products from data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {

    try {
      final products = await ProductRepository.instance.getBrandProducts(brandId: brandId);
      return products;
    } catch (e) {

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return[];
    }

  }
}