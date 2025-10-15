import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:t_store/features/shop/controllers/products/images_controller.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Product Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImages.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImages(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: TColors.primary,
                            ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImages.value == images[index];
                    return TRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                      padding: EdgeInsets.all(TSizes.sm),
                      onPressed: () => controller.selectedProductImages.value = images[index],
                    );
                  }),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: images.length,
                ),
              ),
            ),

            /// App Bar
            TCustomAppBar(
              showBackArrow: true,
              actions: [TFavouriteIcon(productId: product.id,)],
            ),
          ],
        ),
      ),
    );
  }
}
