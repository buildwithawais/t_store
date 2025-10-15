import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/text/product_price_text.dart';
import 'package:t_store/common/widgets/text/product_title.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/shop/controllers/products/attributes_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = AttributeController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          /// Selected Attributes , Pricing & Description
          // Display Variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backGroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  /// Title, Price and Stock Status
                  Row(
                    children: [
                      TSectionHeadings(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(width: TSizes.spaceBtwSections),
                      Column(
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              /// Sale Price
                              TProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Variations Description

                  if (controller.selectedVariation.value.description != null &&
                      controller.selectedVariation.value.description!.isNotEmpty)
                    TProductTitleText(
                      title: controller.selectedVariation.value.description!,
                      smallSize: true,
                      maxLines: 4,
                    ),
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeadings(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                  product.productVariations!,
                                  attribute.name!,
                                ).contains(attributeValue);
                            return TChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(
                                          product,
                                          attribute.name ?? '',
                                          attributeValue,
                                        );
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
