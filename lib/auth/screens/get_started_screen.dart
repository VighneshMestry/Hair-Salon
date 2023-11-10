import 'package:flutter/material.dart';
import 'package:hair_salon/auth/provider/auth_provider.dart';
import 'package:hair_salon/auth/screens/login_screen.dart';
import 'package:hair_salon/home/screens/home_screen.dart';
import 'package:hair_salon/widgets/bottom_bar.dart';

import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/hairSalon.png',
                height: 340,
              ),
              const SizedBox(height: 200),
              SizedBox(
                height: 50,
                width: 320,
                child: ElevatedButton(
                  onPressed: () async {
                    if (authProvider.isSignIn == true) {
                      await authProvider.getUserDataFromSP().whenComplete(
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomBar(),
                              ),
                            ),
                           );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 27, 78, 165),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
