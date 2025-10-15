import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/products/cart_controller.dart';
import 'package:t_store/features/shop/controllers/products/images_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class AttributeController extends GetxController {
  static AttributeController get instance => Get.find();

  /// -- Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// -- Selected Attribute, and Variation
  void onAttributeSelected(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    // when attribute is selected we will first add that attribute to selected Attribute
    final selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the Selected Variation Image as Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImages.value =
          selectedVariation.image;
    }

    // Show selected variation quantity already in the cart
    if (selectedVariation.id.isNotEmpty) {
      final controller = CartController.instance;
      controller.productQuantityInCart.value = controller
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign Selected Variations
    this.selectedVariation.value = selectedVariation;

    // Update selected variation status
    getProductVariationStockStatus();
  }

  /// -- Check if selected attribute matches ant variations attributes
  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    // If selectedAttributes contain 3 attributes and current variation contains 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return e.g [Green , Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = Value Which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  /// -- Check Attribute availability in variation
  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    // Pass the Variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where(
          (variation) =>
              // Check Empty/ Out of Stock Attributes)
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        // fetch all  non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  /// -- Check product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0
        ? 'In Stock'
        : 'Out of Stock';
  }

  /// -- Reset Selected Attributes when switching products
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
