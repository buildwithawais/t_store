import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  /// Variable
  final carousalControllerIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final bannerRepository = Get.put(BannerRepository());


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  ///  Update Page Navigation Dot
  void updatePageIndicator(index) {
    carousalControllerIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader
      isLoading.value = true;

      // Fetch banners from repository
      final banners = await bannerRepository.getBanners();

      // Assign all banners
      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {

      // Remove Loader
      isLoading.value = false;
    }
  }
}