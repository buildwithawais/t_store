import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/products/favourite_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TCustomAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Obx(
              () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  /// -- Nothing Found Widget
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: TImages.wishlist,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () => Get.to(() => const NavigationMenu()),
                  );

                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget,
                  );
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: products[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
