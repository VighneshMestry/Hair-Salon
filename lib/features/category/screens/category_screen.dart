import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/widgets/category_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text("Category",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTile(
                  imageUrl: "assets/haircut.png", categoryName: "HairCut"),
              CategoryTile(
                  imageUrl: "assets/makeup.png", categoryName: "Makeup"),
              CategoryTile(
                  imageUrl: "assets/straightening.png",
                  categoryName: "Straightening"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTile(
                  imageUrl: "assets/mani-pedi.png", categoryName: "Mani-Pedi"),
              CategoryTile(imageUrl: "assets/spa.png", categoryName: "Spa"),
              CategoryTile(
                  imageUrl: "assets/beard.png", categoryName: "Beard Trimming"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryTile(
                  imageUrl: "assets/haircoloring.png",
                  categoryName: "Hair Coloring"),
              CategoryTile(
                  imageUrl: "assets/waxing.png", categoryName: "Waxing"),
              CategoryTile(
                  imageUrl: "assets/facial.png", categoryName: "Facial"),
            ],
          ),
        ],
      ),
    ));
  }
}
