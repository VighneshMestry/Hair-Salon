// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hair_salon/features/schedule/screens/schedule_screen.dart';

import 'package:hair_salon/models/services_model.dart';
import 'package:hair_salon/style.dart';

class ServiceDetailsContent extends StatelessWidget {
  final ServiceModel service;
  const ServiceDetailsContent({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(service.serviceName, style: serviceWhiteTitleTextStyle),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.21),
            child: FittedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    service.location,
                    style: serviceLocationTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Stylist",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // for (final guest in guests)
                //   Padding(
                //     padding: const EdgeInsets.all(8),
                //     // Forms a Oval shape
                //     child: ClipOval(
                //       child: Image.asset(
                //         guest.imagePath,
                //         height: 90,
                //         width: 90,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/user.png",
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Used when two text's having different text style are used in the same line
          Padding(
            padding: const EdgeInsets.all(16),
            // child: RichText(
            //   text: TextSpan(children: [
            //     TextSpan(text: service.description.substring(0, (service.description.length~/2)), style: punchLine1TextStyle),
            //     TextSpan(text: service.description.substring((service.description.length~/2), service.description.length), style: punchLine2TextStyle),
            //   ]),
            // ),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Where every strand finds its perfect style and ",
                    style: punchLine1TextStyle),
                TextSpan(
                    text: "every face discovers its radiant smile!",
                    style: punchLine2TextStyle),
              ]),
            ),
          ),

          if (service.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                service.description,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(service.rating.toString()),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleScreen(service: service)));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 27, 78, 165),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "Schedule a session",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text("(Services available only on weekdays)",),
          )
        ],
      ),
    );
  }
}
