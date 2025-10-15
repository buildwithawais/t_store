import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/supabase_storage_service.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// -- Variables
  final _db = FirebaseFirestore.instance;
  final _storage = SupabaseStorageService();

  /// Get All Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs
          .map((e) => BrandModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching brands:$e';
    }
  }

  /// Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {

      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategory = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract BrandIds from the documents
      List<String> brandIds = brandCategory.docs.map((doc) => doc['brandId'] as String).toList();

      if (brandIds.isEmpty) return [];

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =  brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching brands:$e';
    }
  }

  /// -- Upload Dummy Brands
  Future<void> uploadDummyBrands(List<BrandModel> brands) async {
    try {
      for (var brand in brands) {
        // Upload brand logo (from assets) to Supabase Storage
        final imageUrl = await _storage.uploadAssetImage(
          bucket: 'brands',
          assetPath: brand.image,
          fileName: '${brand.id}.png',
        );

        brand.image = imageUrl;

        // Upload Brand to firestore
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Error uploading brands: $e";
    }
  }
}
