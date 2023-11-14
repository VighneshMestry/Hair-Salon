import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/home/provider/home_provider.dart';
import 'package:hair_salon/home/widgets/service_card.dart';
import 'package:provider/provider.dart';

class FeaturedServices extends StatefulWidget {
  const FeaturedServices({super.key});

  @override
  State<FeaturedServices> createState() => _FeaturedServicesState();
}

class _FeaturedServicesState extends State<FeaturedServices> {
  int currentIndex = 0;
  var services = [];
  void getAllServices() async {
    final _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    services = await _homeProvider.getAllServices();
  }

  @override
  void initState() {
    super.initState();
    getAllServices();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Featured Services",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    activeSize: const Size(15, 6),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                dotsCount: 3,
                position: 0,
              ),
            ],
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 230,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ServiceCard(serviceModel: services[index]),
                );
              },
            ),
          )

          // for(int i =0 ; i < 50; i++)
          //   Text("hello", style: TextStyle(color: Colors.black),),

          // CarouselSlider(
          //   items: GlobalVariables.carouselImages.map(
          //     (e) {
          //       return Builder(
          //         builder: (BuildContext context) => Padding(
          //           padding: const EdgeInsets.only(left: 8, right: 12),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(8.0),
          //             child: Image.asset(
          //               e,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ).toList(),
          //   options: CarouselOptions(
          //     enableInfiniteScroll: false,
          //     onPageChanged: (index, reason) {
          //       setState(() {
          //         currentIndex = index;
          //       });
          //     },
          //     viewportFraction: 0.5,
          //     height: 180,
          //   ),
          // ),
        ],
      ),
    );
  }
}
