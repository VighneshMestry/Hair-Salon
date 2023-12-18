// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/widgets/service_details.dart';

import 'package:hair_salon/models/services_model.dart';

class PopularServicesTile extends StatelessWidget {
  final ServiceModel service;
  const PopularServicesTile({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ServiceDetails(service: service),
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade50,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, blurRadius: 8, spreadRadius: 0)
            ],
          ),
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 130,
                  height: 172,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      service.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.serviceName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(service.location,
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 150,
                        child: Text(
                          service.description,
                          style: TextStyle(fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                        )),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(service.rating.toString()),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 8, left: 8, bottom: 8),
                  child: Icon(
                    Icons.bookmark_add_rounded,
                    color: Colors.red.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
