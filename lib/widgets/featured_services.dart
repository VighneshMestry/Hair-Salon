import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/constants/global_variables.dart';

class FeaturedServices extends StatefulWidget {
  const FeaturedServices({super.key});

  @override
  State<FeaturedServices> createState() => _FeaturedServicesState();
}

class _FeaturedServicesState extends State<FeaturedServices> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Featured Services"),
              DotsIndicator(
                decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    activeSize: const Size(20, 9),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                dotsCount: 3,
                position: 0,
              ),
            ],
          ),
          const SizedBox(height: 10),
          for(int i =0 ; i < 50; i++) 
            Text("hello"),

          CarouselSlider(
          items: GlobalVariables.carouselImages.map(
            (e) {
              return Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 0.5,
            height: 180,
          ),
        ),

        ],
      ),
    );
  }
}
