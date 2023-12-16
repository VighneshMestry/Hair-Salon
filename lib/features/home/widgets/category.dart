import 'package:flutter/material.dart';
import 'package:hair_salon/features/category/screens/category_screen.dart';
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
                child: const Text("View All"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/haircut.png", fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Image.asset("assets/makeup.png", fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/straightening.png", fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/mani-pedi.png", fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Image.asset("assets/spa.png", fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/beard.png", fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}