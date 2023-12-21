import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_salon/models/services_model.dart';

class Appointment {
  final ServiceModel service;
  final DateTime date;
  final String time;
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
    String? time,
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
      'time': time,
      'noOfHours': noOfHours,
      'uid': uid,
    };
  }

  factory Appointment.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document
        .data()!; // Here the document.data() give the whole snapshot data to the us, but if we need only one field from the snapshot we can user document.get() instead
    return Appointment(
      service: ServiceModel.fromMap(data["service"]),
      date: DateTime.fromMillisecondsSinceEpoch(data['date']),
      // time: TimeOfDay(
      //     hour: int.parse(data["time"].split(":")[0]),
      //     minute: int.parse(data["time"].split(":")[1])),
      time: data["time"],
      noOfHours: data["noOfHours"],
      uid: data["uid"],
    );
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      service: ServiceModel.fromMap(map['service'] as Map<String, dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      time: map['time'] as String,
      noOfHours: map['noOfHours'] as int,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointment(service: $service, date: $date, time: $time, noOfHours: $noOfHours, uid: $uid)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.service == service &&
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
