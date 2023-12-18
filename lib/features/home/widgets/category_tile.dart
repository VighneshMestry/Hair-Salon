// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hair_salon/features/category/screens/single_category_list.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const CategoryTile({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCategoryList(category: categoryName)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
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
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(categoryName, style: const TextStyle(fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}
