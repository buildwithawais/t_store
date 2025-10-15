import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/supabase_storage_service.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final storage = Get.put(SupabaseStorageService());

  /// Get Limited Featured Products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Limited Featured Products
  Future<List<ProductModel>> getBrandProducts({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
                .collection('Products')
                .where('Brand.Id', isEqualTo: brandId)
                .get()
          : await _db
                .collection('Products')
                .where('Brand.Id', isEqualTo: brandId)
                .limit(limit)
                .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// -- Get Category related brand products
  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .get()
          : await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .limit(limit)
                .get();

      // Extract Product Ids from the documents
      List<String> productIds = querySnapshot.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      if (productIds.isEmpty) return [];

      // Query to get all documents where the brandId is in the list of the brandIds, FieldPath.documentId to query documents in collection
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand names  or other relevant data from th documents
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get All Products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Limited Featured Products
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Limited Featured Products
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Dummy Data
  Future<void> uploadDummyProducts(List<ProductModel> products) async {
    try {
      // Loop Through each product
      for (var product in products) {
        // Upload Image and get download URL
        final thumbnailUrl = await storage.uploadAssetImage(
          bucket: 'products',
          assetPath: product.thumbnail,
          fileName: '${product.id}_thumbnail.png',
        );

        // Assign Url
        product.thumbnail = thumbnailUrl;

        // Product List of Images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // Get image data link from assets
            final url = await storage.uploadAssetImage(
              bucket: 'products',
              assetPath: image,
              fileName:
                  '${product.id}_${DateTime.now().millisecondsSinceEpoch}.png',
            );
            imagesUrl.add(url);
          }

          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Upload Variation Image to Supabase
            final url = await storage.uploadAssetImage(
              bucket: 'products',
              assetPath: variation.image,
              fileName: '${product.id}_${variation.id}.png',
            );

            // Replace Url
            variation.image = url;
          }
        }

        // Storage Product in FireStore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
