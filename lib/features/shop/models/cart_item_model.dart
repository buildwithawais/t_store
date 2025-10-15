class CartItemModel {
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.title = '',
    this.price = 0.0,
    this.image,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Empty Model
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert a CArt Item to Json
  Map<String, dynamic> toJson() {
    return {
      'productId' : productId,
      'title' : title,
      'price' : price,
      'image' : image,
      'quantity' : quantity,
      'variationId' : variationId,
      'brandName' : brandName,
      'selectedVariation' : selectedVariation,
    };
  }

  /// Convert Json to Create Item
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      title: json['title'],
        brandName: json['brandName'],
        image: json['image'],
        price: json['price']?.toDouble(),
        variationId: json['variationId'],
        productId: json['productId'],
        quantity: json['quantity'],
        selectedVariation: json['selectedVariation'] != null ? Map<String, String>.from(json['selectedVariation']) : null,
    );
  }
}
