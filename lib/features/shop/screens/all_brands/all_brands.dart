import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/t_brand_card.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/all_brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/brands_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TCustomAppBar(title: Text('All Brands', style: Theme
          .of(context)
          .textTheme
          .displayMedium), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// Headings
              TSectionHeadings(title: 'Brands', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Brands
              Obx(() {
                if(controller.isLoading.value) return TBrandsShimmer();

                if(controller.allBrands.isEmpty) {
                  return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                }
                return TGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index];
                      return TBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand,)));
                    }

                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
