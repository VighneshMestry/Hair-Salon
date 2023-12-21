import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/appointment_model.dart';

class AppointmentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addAppointment(Appointment appointment, BuildContext context) async {
    try {
      await _firestore
          .collection("Appointment")
          .add(appointment.toMap())
          .whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Appointment Scheduled"),
              ),
            ),
          );
    } on FirebaseException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }

  // Future<List<Appointment>> getUserAppointments(String uid) async {
  //   try {
  //     final snapshots = await _firestore
  //         .collection("Appointment")
  //         .where("uid", isEqualTo: uid)
  //         .get();
  //     final list =
  //         snapshots.docs.map((e) => Appointment.fromSnapshot(e)).toList();
  //     print(list);
  //     print("111111111111111111111111111111111111111111111111111");
  //     return list;
  //   } catch (e) {
  //     throw(e.toString());
  //   }
  // }

  Future<List<Appointment>> getAllAppointments() async {

      final snapshots = await _firestore
          .collection("Appointment")
          .get();
      final list =
          snapshots.docs.map((e) => Appointment.fromSnapshot(e)).toList();
      return list;
    
  }

  // Future<List<Appointment>> getUserAppointments() {

  // }
}
