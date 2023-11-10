import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/constants/global_variables.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({super.key});

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: GlobalVariables.carouselImages.map(
            (e) {
              return Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                      // height: 220,
                      width: MediaQuery.of(context).size.width - 20,
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
            viewportFraction: 1,
            height: 220,
          ),
        ),
        DotsIndicator(
          decorator: DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.blue,
              activeSize: const Size(20, 9),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          dotsCount: GlobalVariables.carouselImages.length,
          position: currentIndex,
        ),
      ],
    );
  }
}
