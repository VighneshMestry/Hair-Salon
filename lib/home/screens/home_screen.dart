import 'package:flutter/material.dart';
import 'package:hair_salon/auth/provider/auth_provider.dart';
import 'package:hair_salon/auth/screens/get_started_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hair Salon",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
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
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(authProvider.userModel.phoneNumber),
            Text(authProvider.userModel.uid),
            Text(authProvider.userModel.createdAt),
          ],
        ),
      ),
    );
  }
}
