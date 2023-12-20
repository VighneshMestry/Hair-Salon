import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/services_model.dart';

class CategoryProvider extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<ServiceModel>> getServicesByCategory(String category) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection("Services")
          .where("category", isEqualTo: category)
          .get();
      final services =
          snapshot.docs.map((e) => ServiceModel.fromSnapshot(e)).toList();
      return services;
    } catch (e) {
      throw (e.toString());
    }
  }
}
