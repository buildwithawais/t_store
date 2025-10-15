import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/data/dummy/dummy_data.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/data/repositories/relations/relations_repository.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/button_tiles.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final relationsrepo = Get.put(RelationsRepository());
    final brandRepository = Get.put(BrandRepository());
    return Scaffold(
      appBar: TCustomAppBar(
        title: Text(
          'Upload Data',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TSectionHeadings(
              title: 'Main Record',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TButtonTile(
              leadingIcon: Iconsax.category,
              title: 'Upload Categories',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Categories...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await CategoryRepository.instance.uploadDummyData(
                    TDummyData.categories,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Success',
                    message:
                        'Dummy categories have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
            TButtonTile(
              leadingIcon: Iconsax.shop,
              title: 'Upload Brands',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Brands...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await brandRepository.uploadDummyBrands(
                    TDummyData.brands,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Success',
                    message:
                    'Dummy Brands have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
            TButtonTile(
              leadingIcon: Iconsax.shopping_cart,
              title: 'Upload Products',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Products...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await ProductRepository.instance.uploadDummyProducts(
                    TDummyData.products,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Success',
                    message:
                    'Dummy Products have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
            TButtonTile(
              leadingIcon: Iconsax.image,
              title: 'Upload Banners',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Banners...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await BannerRepository.instance.uploadDummyBanners(
                    TDummyData.banners,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Success',
                    message: 'Dummy banners have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            const TSectionHeadings(
              title: 'Relationships',
              showActionButton: false,
            ),
            Text(
              'Make sure you have already uploaded all the content above.',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TButtonTile(
              leadingIcon: Iconsax.link,
              title: 'Upload Brands & Categories Relation Data',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Brands & Categories Relation Data...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await relationsrepo.uploadDummyBrandCategoryRelations(
                    TDummyData.brandCategories,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Upload Success!',
                    message:
                    'Brands & Categories Relation Data have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
            TButtonTile(
              leadingIcon: Iconsax.link,
              title: 'Upload Product & Categories Relation Data',
              trailingIcon: Iconsax.arrow_up_1,
              onTap: () async {
                try {
                  // show Loader
                  TFullScreenLoader.openLoadingDialog(
                    'Uploading Product & Categories Relation Data...',
                    TImages.docerAnimation,
                  );

                  // Perform Upload
                  await relationsrepo.uploadDummyProductCategoryRelations(
                    TDummyData.productCategories,
                  );

                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Success Snackbar
                  TLoaders.successSnackBar(
                    title: 'Upload Success!',
                    message:
                    'Product & Categories Relation Data have been uploaded successfully!',
                  );
                } catch (e) {
                  // Stop Loader
                  TFullScreenLoader.stopLoading();

                  // Show Error Snackbar
                  TLoaders.errorSnackBar(
                    title: "Upload Failed",
                    message: e.toString(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
