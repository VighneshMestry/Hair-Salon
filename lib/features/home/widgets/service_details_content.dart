// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:hair_salon/models/services_model.dart';

// class ServiceDetailsContent extends StatelessWidget {
//   final ServiceModel service;
//   const ServiceDetailsContent({
//     Key? key,
//     required this.service,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     final screenWidth = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 100),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
//             child: Text(service.serviceName, ), //style: eventWhiteTitleTextStyle
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.21),
//             child: FittedBox(
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.location_on,
//                     color: Colors.white,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     service.originalPrice,
//                     // style: eventLocationTextStyle.copyWith(
//                     //     color: Colors.white, fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 80,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: Text(
//               "GUESTS",
//               style: guestTextStyle,
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 for (final guest in guests)
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     // Forms a Oval shape
//                     child: ClipOval(
//                       child: Image.asset(
//                         guest.imagePath,
//                         height: 90,
//                         width: 90,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Used when two text's having different text style are used in the same line
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: RichText(
//               text: TextSpan(children: [
//                 TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
//                 const TextSpan(text: "  "),
//                 TextSpan(text: event.punchLine2, style: punchLine2TextStyle),
//               ]),
//             ),
//           ),

//           if (event.description.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 event.description,
//                 style: eventLocationTextStyle,
//               ),
//             ),

//           if (event.galleryImages.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
//               child: Text(
//                 "GALLERY",
//                 style: guestTextStyle,
//               ),
//             ),
//             SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 for (final galleryImagePath in event.galleryImages)
//                   Container(
//                     margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
//                     // Forms a Oval shape
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.all(Radius.circular(20),),
//                       child: Image.asset(
//                         galleryImagePath,
//                         height: 180,
//                         width: 180,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),

//         ],
//       ),
//     );
//   }
//   }
