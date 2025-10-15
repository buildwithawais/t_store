import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/features/shop/controllers/order_controller.dart';
import 'package:t_store/features/shop/controllers/products/attributes_controller.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

import '../features/shop/controllers/products/favourite_controller.dart';

 class GeneralBindings extends Bindings {
  @override
  void dependencies() {

    /// 1️⃣ Core Services (No dependency on others)
    Get.put(NetworkManager());

    /// 2️⃣ Product Related Controllers
    Get.put(AttributeController());

    /// 3️⃣ Address & User Data Controllers
    Get.put(AddressController());

    /// 4️⃣ Core Shop Logic (Cart must be before Order & Checkout)
    Get.put(CartController());

    /// 5️⃣ Checkout Depends on Cart & Address
    Get.put(CheckoutController());

    /// 6️⃣ Order Depends on Cart, Checkout & Address
    Get.put(OrderController());

    /// 7️⃣ Favourite Controller
    Get.put(FavouriteController());
  }
 }