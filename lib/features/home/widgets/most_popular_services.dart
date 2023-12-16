import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/widgets/popular_services_tile.dart';
import 'package:hair_salon/models/services_model.dart';

class MostPopularServices extends StatefulWidget {
  const MostPopularServices({super.key});

  @override
  State<MostPopularServices> createState() => _MostPopularServicesState();
}

class _MostPopularServicesState extends State<MostPopularServices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Most Popular Services",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          PopularServicesTile(
            service: ServiceModel(
                serviceName: "Demo",
                originalPrice: "5000",
                discountedPrice: "2500",
                description: "vighneshvighneshvighneshvighneshvighneshvighnesh",
                category: "Hair Cut",
                location: "Mumbai, Maharashtra",
                rating: 5,
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/hair-salon-85cab.appspot.com/o/serviceImage%2Fdemo?alt=media&token=0d61e60f-8106-4fcc-b4f9-feb6522614c0"),
          ),
        ],
      ),
    );
  }
}
