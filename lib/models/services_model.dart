// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceModel {
  final String serviceName;
  final String originalPrice;
  final String discountedPrice;
  final String imageUrl;

  ServiceModel({
    required this.serviceName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      serviceName: map["serviceName"] ?? ' ',
      originalPrice: map["originalPrice"] ?? ' ',
      discountedPrice: map["discountedPrice"] ?? ' ',
      imageUrl: map["imageUrl"] ?? ' ',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "serviceName" : serviceName,
      "originalPrice" : originalPrice,
      "discountedPrice" : discountedPrice,
      "imageUrl" : imageUrl,
    };
  }
}
