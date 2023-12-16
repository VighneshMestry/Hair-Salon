// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hair_salon/models/services_model.dart';

class ServiceDetailsBackground extends StatefulWidget {
  final ServiceModel service;
  const ServiceDetailsBackground({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<ServiceDetailsBackground> createState() => ServiceDetailsBackgroundState();
}

class ServiceDetailsBackgroundState extends State<ServiceDetailsBackground> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.network(
          widget.service.imageUrl,
          fit: BoxFit.cover,
          width: screenWidth,
          color: const Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          height: screenHeight * 0.5,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = const Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(
        size.width * 0.2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
