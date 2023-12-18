// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hair_salon/features/category/provider/category_provider.dart';
import 'package:hair_salon/features/home/widgets/popular_services_tile.dart';
import 'package:hair_salon/models/services_model.dart';
import 'package:provider/provider.dart';

class SingleCategoryList extends StatefulWidget {
  final String category;
  const SingleCategoryList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<SingleCategoryList> createState() => _SingleCategoryListState();
}

class _SingleCategoryListState extends State<SingleCategoryList> {
  List<ServiceModel> servicesByCategory = [];
  void getServicesByCategory() async {
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    servicesByCategory =
        await categoryProvider.getServicesByCategory(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getServicesByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text("${widget.category} services",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18)),
            ),
            // const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: servicesByCategory.length,
              itemBuilder: (context, index) {
                return PopularServicesTile(service: servicesByCategory[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
