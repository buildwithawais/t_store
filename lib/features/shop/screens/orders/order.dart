import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/orders/widgets/order_list.dart';
import 'package:t_store/utils/constants/sizes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TCustomAppBar(
        title: Text('orders', style: Theme
            .of(context)
            .textTheme
            .headlineSmall), showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        /// orders
        child: TOrderListItem(),
      ),
    );
  }
}
