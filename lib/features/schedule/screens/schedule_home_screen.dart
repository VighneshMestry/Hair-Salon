import 'package:flutter/material.dart';
import 'package:hair_salon/features/home/provider/home_provider.dart';
import 'package:hair_salon/features/home/widgets/popular_services_tile.dart';
import 'package:hair_salon/models/services_model.dart';
import 'package:hair_salon/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:searchbar_animation/const/dimensions.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class ScheduleHomeScreen extends StatefulWidget {
  const ScheduleHomeScreen({super.key});

  @override
  State<ScheduleHomeScreen> createState() => _ScheduleHomeScreenState();
}

class _ScheduleHomeScreenState extends State<ScheduleHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ServiceModel> searchList = [];
  void getServiceByName(String serviceName) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    searchList.clear();
    searchList = await homeProvider.getServiceByName(serviceName);
    setState(() {});
  }

  void getAllServices() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    searchList = await homeProvider.getAllServices();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: searchList.isEmpty
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text("Schedule an Appointment",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SearchBarAnimation(
                            textEditingController: _searchController,
                            isOriginalAnimation: true,
                            trailingWidget: const Icon(Icons.search),
                            secondaryButtonWidget: const Icon(Icons.close),
                            buttonWidget: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            searchBoxWidth:
                                MediaQuery.of(context).size.width - 40,
                            durationInMilliSeconds: Dimensions.t700,
                            // isSearchBoxOnRightSide: true,
                            onChanged: (value) {
                              setState(() {
                                // searchString = value;
                              });
                              getServiceByName(value);
                              // filterSearchResults(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Available services",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchList.length,
                    itemBuilder: (context, index) =>
                        PopularServicesTile(service: searchList[index]),
                  ),
                ],
              ),
            ),
    );
  }
}
