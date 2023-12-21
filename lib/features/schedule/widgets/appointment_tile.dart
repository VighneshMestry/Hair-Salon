// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hair_salon/models/appointment_model.dart';

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  const AppointmentTile({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Service Name: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: appointment.service.serviceName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
              )),
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Appointment Date: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: appointment.date.toString().substring(0, 10),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
              )),
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Appointment Time: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: appointment.time.substring(10, 15),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
              )),
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Duration: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: appointment.noOfHours.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
              ))
              
            ],
          ),
        ),
      ),
    );
  }
}
