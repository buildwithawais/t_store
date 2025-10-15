import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Padding(
      padding: EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          TSectionHeadings(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: TColors.white,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Obx(() {
            if (categoryController.isLoading.value) {
              return const TCategoryShimmer();
            }

            if (categoryController.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  'No Data Found!',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.apply(color: Colors.white),
                ),
              );
            }
            return SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: categoryController.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final category = categoryController.featuredCategories[index];
                  return TVerticalImageText(
                    isNetworkImage: true,
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(() => TSubCategoriesScreen(category: category)),
                  );
                }
                ),
            );
          }),
        ],
      ),
    );
  }
}
