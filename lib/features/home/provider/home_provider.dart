import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/services_model.dart';

// final homeProviderProvider = Provider(create: (context) => HomeProvider(),);

class HomeProvider extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<ServiceModel>> getAllServices() async {
    try {
      final snapshot = await _firebaseFirestore.collection("Services").get();
      final services =
          snapshot.docs.map((e) => ServiceModel.fromSnapshot(e)).toList();
      return services;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<ServiceModel> getServiceDetails(String serviceName) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection("Services")
          .where("serviceName", isEqualTo: serviceName)
          .get();
      final service =
          snapshot.docs.map((e) => ServiceModel.fromSnapshot(e)).single;
      return service;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<ServiceModel>> getServiceByName(String serviceName) async {
    try {
      final services = await getAllServices();
      List<ServiceModel> servicesByName = [];
      if (serviceName.isNotEmpty) {
        for (var items in services) {
          if (items.serviceName.toLowerCase().contains(serviceName)) {
            servicesByName.add(items);
          }
        }
        return servicesByName;
      } else {
        return services;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<String> storeImagetoStorage(String ref, File file) async {
    try {
      UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw (e.toString());
    }
  }
}
