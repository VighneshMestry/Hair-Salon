import 'package:flutter/material.dart';
import 'package:hair_salon/models/user_model.dart';
import 'package:hair_salon/auth/provider/auth_provider.dart';
import 'package:hair_salon/home/screens/home_screen.dart';
import 'package:hair_salon/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otp;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: false).isLoading;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_rounded),
                          )),
                    ),
                    Image.asset(
                      'assets/hairSalon.png',
                      height: 340,
                    ),
                    const SizedBox(height: 60),
                    // const Icon(Icons.person, size: 56),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 340,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade300)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 12, bottom: 12),
                        child: Column(
                          children: [
                            Image.asset('assets/lockLogo.png'),
                            const SizedBox(height: 25),
                            Pinput(
                              length: 6,
                              showCursor: true,
                              defaultPinTheme: const PinTheme(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.0, color: Colors.black))),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              onCompleted: (value) {
                                setState(() {
                                  otp = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Resend code in 55 s",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              width: 320,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (otp != null) {
                                    verifyOtp(context, otp!);
                                  } else {
                                    showSnackBar(context, "Enter 6 digit otp");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 27, 78, 165),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: const Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text:
                                      "By continuing you are agreeing to our \n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Terms & Conditions ",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "and ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400)),
                            ]))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String otp) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: otp,
      onSuccess: () {
        authProvider.checkExistingUser().then(
          (value) {
            if (value == true) {
              // user exists
              authProvider.getDataFromFirestore().then(
                    (value) => authProvider.saveUserDataToSP().then(
                          (value) => authProvider.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              storeData();
            }
          },
        );
      },
    );
  }

  void storeData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(phoneNumber: "", uid: "", createdAt: '');
    authProvider.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          // now the data is saved so the data should be stored locally
          authProvider.saveUserDataToSP().then(
                (value) => authProvider.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false),
                    ),
              );
        });
  }
}
