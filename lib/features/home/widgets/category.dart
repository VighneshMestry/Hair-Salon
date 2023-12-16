import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/widgets/category_tile.dart';
import 'package:hair_salon/widgets/bottom_bar.dart';

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          BottomBar(pageIndex: 1)));
                },
                style: OutlinedButton.styleFrom(side: BorderSide.none),
                child: const Text("View All", style: TextStyle(fontWeight: FontWeight.w800),),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Container(
              //     height: 100,
              //     width: 100,
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.shade200,
              //           blurRadius: 8,
              //         )
              //       ],
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Image.asset("assets/haircut.png", fit: BoxFit.cover,),
              //   ),
              // ),
              CategoryTile(imageUrl: "assets/haircut.png", categoryName: "HairCut"),
              CategoryTile(imageUrl: "assets/makeup.png", categoryName: "Makeup"),
              CategoryTile(imageUrl: "assets/straightening.png", categoryName: "Straightening"),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTile(imageUrl: "assets/mani-pedi.png", categoryName: "Mani-Pedi"),
              CategoryTile(imageUrl: "assets/spa.png", categoryName: "Spa"),
              CategoryTile(imageUrl: "assets/beard.png", categoryName: "Beard Trimming"),
            ],
          ),
        ],
      ),
    );
  }
}