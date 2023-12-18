// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/widgets/service_details_background.dart';
import 'package:hair_salon/features/home/widgets/service_details_content.dart';
import 'package:hair_salon/models/services_model.dart';

class ServiceDetails extends StatelessWidget {
  final ServiceModel service;
  const ServiceDetails({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ServiceDetailsBackground(service: service),
          ServiceDetailsContent(service: service),
        ],
      ),
    );
  }
}

