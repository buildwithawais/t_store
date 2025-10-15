import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  // Initialization
  final SupabaseClient _client = Supabase.instance.client;

  /// Load an asset image into memory
  Future<Uint8List> getImageFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }

  Future<String> uploadAssetImage({
    required String bucket,
    required String assetPath,
    required String fileName,
  }) async {
    try {
      final bytes = await getImageFromAssets(assetPath);

      // Upload binary data
      await _client.storage
          .from(bucket)
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );

      // Get public Url
      return _client.storage.from(bucket).getPublicUrl(fileName);
    } catch (e) {
      throw "Error uploading asset image: $e";
    }
  }

  Future<String> uploadAssetBannerImage({
    required String assetPath,
    required String fileName,
  }) async {
    try {
      final bytes = await getImageFromAssets(assetPath);

      await _client.storage
          .from('banners')
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(upsert: true),
          );
      final publicUrl =  _client.storage.from('banners').getPublicUrl(fileName);
      return publicUrl;
    } catch (e) {
      throw "Error uploading banner asset image: $e";
    }
  }
}
