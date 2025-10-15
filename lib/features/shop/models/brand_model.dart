import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });

  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  // Convert Model to Json Format for upload
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  // convert data from Json to model.
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: int.parse((data['ProductCount'] ?? 0).toString()),
    );
  }

  // Convert to model from snapshot
  factory BrandModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCount: int.parse((data['ProductCount'] ?? 0).toString()),
      );
    } else {
      return BrandModel.empty();
    }
  }
}
