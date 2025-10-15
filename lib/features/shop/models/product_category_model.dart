import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  ProductCategoryModel({required this.categoryId, required this.productId});

  final String categoryId;
  final String productId;

  Map<String, dynamic> toJson() {
    return {'categoryId': categoryId, 'productId': productId};
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      categoryId: data['categoryId'] as String,
      productId: data['productId'] as String,
    );
  }
}
