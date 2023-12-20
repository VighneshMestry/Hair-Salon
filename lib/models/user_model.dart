// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hair_salon/models/appointment_model.dart';

class UserModel {
  String phoneNumber;
  String uid;
  String createdAt;
  List<Appointment> appointments;

  UserModel({
    required this.phoneNumber,
    required this.uid,
    required this.createdAt,
    required this.appointments
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map["phoneNumber"] ?? ' ',
      uid: map["uid"] ?? ' ',
      createdAt: map["createdAt"] ?? ' ', 
      appointments: List<Appointment>.from(map["appointments"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber" : phoneNumber,
      "uid" : uid,
      "createAt" : createdAt,
      "appointments": appointments
    };
  }
}


