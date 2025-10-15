import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/supabase_storage_service.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _storage = SupabaseStorageService();

  /// Get all order related to current user
  Future<List<BannerModel>> getBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Dummy Banners to Supabase and get Download URL
  Future<void> uploadDummyBanners(List<BannerModel> banners) async {
    try {

      for (var banner in banners) {

        // Upload banner image (from assets) to Supabase Storage
        final imageUrl = await _storage.uploadAssetBannerImage(
          assetPath: banner.imageUrl,
          fileName: banner.targetScreen.replaceAll('/', '_'),
        );

        // Replace asset path with Supabase public URL
        banner.imageUrl = imageUrl;

        // Upload banner data to Firestore
        await _db.collection('Banners').add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Error uploading banners: $e";
    }
  }
}
