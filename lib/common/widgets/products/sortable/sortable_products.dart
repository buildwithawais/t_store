import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        /// DropDown Filter
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),

          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest']
              .map(
                (options) =>
                    DropdownMenuItem(value: options, child: Text(options)),
              )
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the Selector Option
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Products
        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
