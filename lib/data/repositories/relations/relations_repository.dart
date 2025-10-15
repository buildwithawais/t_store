import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_category_model.dart';
import 'package:t_store/features/shop/models/product_category_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class RelationsRepository extends GetxController {
  static RelationsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Upload Dummy Brand-Category Relations
  Future<void> uploadDummyBrandCategoryRelations(List<BrandCategoryModel> relations) async {
    try {
      for (var relation in relations) {
        await _db
            .collection('BrandCategory')
            .add(relation.toJson()); // auto ID for each relation
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Error uploading BrandCategory relations: $e";
    }
  }


  /// Upload BrandCategory Relations Data to Firestore
  Future<void> uploadDummyProductCategoryRelations (List<ProductCategoryModel> relations) async {
    try {
      for(var relation in relations) {
        await _db.collection('ProductCategory').add(relation.toJson());
        // auto ID for each relation
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Error uploading ProductCategory relations: $e";
    }
  }
}