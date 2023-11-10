// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  final String serviceName;
  final String originalPrice;
  final String discountedPrice;
  String imageUrl;

  ServiceModel({
    required this.serviceName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
  });

  // Converts Map/ Json to ServiceModel
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      serviceName: map["serviceName"] ?? ' ',
      originalPrice: map["originalPrice"] ?? ' ',
      discountedPrice: map["discountedPrice"] ?? ' ',
      imageUrl: map["imageUrl"] ?? ' ',
    );
  }

  // Converts DocumentSnapshot(documentsnapshot in form of Map<String, dynamic>) provided by firebase to ServiceModel
  factory ServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;  // Here the document.data() give the whole snapshot data to the us, but if we need only one field from the snapshot we can user document.get() instead
    return ServiceModel(
      serviceName: data["serviceName"],
      originalPrice: data["originalPrice"],
      discountedPrice: data["discountedPrice"],
      imageUrl: data["imageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "serviceName": serviceName,
      "originalPrice": originalPrice,
      "discountedPrice": discountedPrice,
      "imageUrl": imageUrl,
    };
  }
}
