import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header Container -->
            TPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// Custom AppBar -->
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Custom Search Bar -->
                  const TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Scrollable Categories -->
                  THomeCategories(),
                  const SizedBox(height: TSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),

            /// Scrollable Promo Banners -->
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [

                  /// Promo Sliders
                  TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Popular Products Heading
                  TSectionHeadings(title: 'Popular Products', onPressed: () => Get.to(() => AllProductsScreen(title: 'Popular Products', futureMethod: controller.fetchAllFeaturedProducts(),)),),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Popular Products Cards -->
                  Obx(
                    () {
                      if(controller.isLoading.value) return const TVerticalProductShimmer();
                      if(controller.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                      }
                      return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
