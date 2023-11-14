import 'package:flutter/material.dart';
import 'package:hair_salon/models/services_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServiceCard({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.network(
              serviceModel.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceModel.serviceName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                // const SizedBox(height: 2),
                Row(
                  children: [
                    Text("Rs ${serviceModel.discountedPrice}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 15),
                    Text(
                      "Rs ${serviceModel.originalPrice}",
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchServices() async {}
}
