import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hair_salon/models/services_model.dart';

class Appointment {
  final ServiceModel service;
  final DateTime date;
  final TimeOfDay time;
  final int noOfHours;
  final String uid;
  Appointment({
    required this.service,
    required this.date,
    required this.time,
    required this.noOfHours,
    required this.uid,
  });

  Appointment copyWith({
    ServiceModel? service,
    DateTime? date,
    TimeOfDay? time,
    int? noOfHours,
    String? uid,
  }) {
    return Appointment(
      service: service ?? this.service,
      date: date ?? this.date,
      time: time ?? this.time,
      noOfHours: noOfHours ?? this.noOfHours,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'service': service.toMap(),
      'date': date.millisecondsSinceEpoch,
      'time': time.toString(),
      'noOfHours': noOfHours,
      'uid': uid,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      service: ServiceModel.fromMap(map['service'] as Map<String,dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      time: TimeOfDay(hour:int.parse(map["time"].split(":")[0]),minute: int.parse(map["time"].split(":")[1])),
      noOfHours: map['noOfHours'] as int,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) => Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointment(service: $service, date: $date, time: $time, noOfHours: $noOfHours, uid: $uid)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;
  
    return 
      other.service == service &&
      other.date == date &&
      other.time == time &&
      other.noOfHours == noOfHours &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return service.hashCode ^
      date.hashCode ^
      time.hashCode ^
      noOfHours.hashCode ^
      uid.hashCode;
  }
}
