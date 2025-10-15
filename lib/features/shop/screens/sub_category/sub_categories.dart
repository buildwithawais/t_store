import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_images.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class TSubCategoriesScreen extends StatelessWidget {
  const TSubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TCustomAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const TRoundedImage(
              imageUrl: TImages.promoBanner4,
              applyImageRadius: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Sub Categories
            FutureBuilder(
              future: controller.getSubCategories(category.id),
              builder: (context, snapshot) {
                // Handle Loader, No Record, Or Error Message
                const loader = THorizontalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                );
                if (widget != null) return widget;

                /// Record Found!
                final subCategories = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final subCategory = subCategories[index];
                    return FutureBuilder(
                      future: controller.getCategoryProducts(
                        categoryId: subCategory.id,
                      ),
                      builder: (context, snapshot) {
                        // Handle Loader, No Record, Or Error Message
                        const loader = THorizontalProductShimmer();
                        final widget =
                            TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                            );
                        if (widget != null) return widget;

                        /// Record Found!
                        final products = snapshot.data!;

                        return Column(
                          children: [
                            /// Heading
                            TSectionHeadings(
                              title: subCategory.name,
                              onPressed: () => Get.to(
                                () => AllProductsScreen(
                                  title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(
                                    categoryId: subCategory.id,
                                    limit: -1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems / 2),

                            /// Product Card Horizontal
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: TSizes.spaceBtwItems),
                                itemBuilder: (_, index) => TProductCardHorizontal(
                                  product: products[index],
                                ),
                              ),
                            ),

                            const SizedBox(height: TSizes.spaceBtwSections),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
