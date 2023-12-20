import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/features/auth/provider/auth_provider.dart';
import 'package:hair_salon/models/appointment_model.dart';
import 'package:provider/provider.dart';

class AppointmentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addAppointment(Appointment appointment, BuildContext context) async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
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
      await _firestore.collection("users").doc(authProvider.uid).update(
        {
          "appointments": appointment.toMap()
        },
      );
      await _firestore.collection("Services").doc("UqToHCmdpHktSt1AJf4z").update(
        {
          "appointments": appointment.toMap()
        },
      );
    } on FirebaseException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw (e.toString());
    }
  }
}
