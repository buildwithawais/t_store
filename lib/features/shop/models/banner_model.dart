import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  String imageUrl;
  final String targetScreen;
  final bool active;

  // convert model data to Json to upload to firebase.
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  // convert data received in snapshot in json back to model for app to understand.
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
