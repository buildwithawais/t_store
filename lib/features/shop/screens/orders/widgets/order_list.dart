import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/order_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        /// Nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! No Orders yet!',
          showAction: true,
          actionText: 'Let\'s fill it',
          animation: TImages.orderAnimation,
          onActionPressed: () => Get.to(() => const NavigationMenu()),
        );

        // Helper Function : Handle Loader, Errors, No Record
        final response = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          nothingFound: emptyWidget,
        );
        if (response != null) return response;

        /// Congratulations Record Found!
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backGroundColor: dark ? TColors.dark : TColors.light,
              showBorder: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Row 1 -->
                  Row(
                    children: [
                      /// 1-Icon
                      Icon(Iconsax.ship),
                      SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// Order Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatus,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(
                                    color: TColors.primary,
                                    fontWeightDelta: 2,
                                  ),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_3, size: TSizes.iconSm),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// 1-Icon
                            Icon(Iconsax.tag),
                            SizedBox(width: TSizes.spaceBtwItems / 2),

                            /// Order Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(fontWeightDelta: 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            /// 1-Icon
                            Icon(Iconsax.calendar),
                            SizedBox(width: TSizes.spaceBtwItems / 2),

                            /// Order Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(fontWeightDelta: 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
