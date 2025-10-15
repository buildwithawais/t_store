import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/orders/order_repository.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch User's orders history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // start loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.processingAnimation);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        // Generate a unique key for order
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // save order
      await orderRepository.saveOrder(order, userId);

      // update cart status
      cartController.clearCart();

      // show success screen
      Get.off(() =>
          SuccessScreen(title: 'Payment Successful!',
              subtitle: 'Your item will be shipped soon',
              animation: TImages.payment,
              onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}