import 'package:flutter/material.dart';
import 'package:hair_salon/features/auth/provider/auth_provider.dart';
import 'package:hair_salon/features/auth/screens/get_started_screen.dart';
import 'package:hair_salon/features/home/widgets/carousel.dart';
import 'package:hair_salon/features/home/widgets/featured_services.dart';
import 'package:provider/provider.dart';
import 'package:searchbar_animation/const/dimensions.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/user.png",
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                Text(
                  "Vighnesh Mestry",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    authProvider.userSignOut().then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetStarted(),
                            ),
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
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
                        searchBoxWidth: MediaQuery.of(context).size.width - 40,
                        durationInMilliSeconds: Dimensions.t700,
                        // isSearchBoxOnRightSide: true,
                        onChanged: (value) {
                          setState(() {
                            // searchString = value;
                          });
                          // filterSearchResults(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CarouselImages(),
            const SizedBox(height: 30),
            const FeaturedServices(),
          ],
        ),
      ),
    );
  }
}
