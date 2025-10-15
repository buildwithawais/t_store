import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/supabase_storage_service.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;
  final _storage = SupabaseStorageService();

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Dummy Data to Supabase Storage
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      for (var category in categories) {

        // Upload image from assets to supabase
        final imageUrl = await _storage.uploadAssetImage(
          bucket: 'categories',
          assetPath: category.image,
          fileName: '${category.id}.png',
        );

        category.image = imageUrl;

        // Save Category data with supabase image url in Firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } catch (e) {
      throw "Error uploading categories: $e";
    }
  }
}
