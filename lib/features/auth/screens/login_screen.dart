import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/features/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

enum PasswordScreen {
  show,
  hide,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  PasswordScreen _passwordScreen = PasswordScreen.hide;
  Country country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    // final isLoading =
    //     Provider.of<AuthProvider>(context, listen: false).isLoading;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              // isLoading == true
              //     ? const Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     :
              Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Image.asset(
                'assets/hairSalon.png',
                height: 340,
              ),
              const SizedBox(height: 60),
              // const Icon(Icons.person, size: 56),
              if (_passwordScreen == PasswordScreen.hide)
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(width: 1.0, color: Colors.grey.shade300)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 22, bottom: 12),
                    child: Column(
                      children: [
                        Image.asset('assets/userLogo.png'),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  phoneController.text = value;
                                });
                              },
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  suffix: phoneController.text.length > 9
                                      ? Container(
                                          height: 16,
                                          width: 16,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green),
                                          child: const Icon(
                                            Icons.done_outline_rounded,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        )
                                      // ? const Icon(Icons.done_outline_rounded, color: Colors.green, size: 12,)
                                      : null,
                                  hintText: "  Enter your phone",
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 11.5),
                                    child: InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                          context: context,
                                          countryListTheme:
                                              CountryListThemeData(
                                                  bottomSheetHeight:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          1.5),
                                          onSelect: (value) {
                                            setState(() {
                                              country = value;
                                            });
                                          },
                                        );
                                      },
                                      child: Text(
                                        "${country.flagEmoji} +${country.phoneCode}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 50,
                          width: 320,
                          child: ElevatedButton(
                            onPressed: () async {
                              sendPhoneNumber();
                              // await FirebaseAuth.instance.verifyPhoneNumber(
                              //   phoneNumber: '+${country.phoneCode}$phoneNumber',
                              //   verificationCompleted:
                              //       (PhoneAuthCredential credential) {},
                              //   verificationFailed:
                              //       (FirebaseAuthException e) {},
                              //   codeSent:
                              //       (String verificationId, int? resendToken) {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => OtpScreen(
                              //           verificationId: verificationId,
                              //         ),
                              //       ),
                              //     );
                              //   },
                              //   codeAutoRetrievalTimeout:
                              //       (String verificationId) {},
                              // );
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
                          height: 20,
                        ),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "By continuing you are agreeing to our \n",
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

  void sendPhoneNumber() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    authProvider.signInWithPhone(context, "+${country.phoneCode}$phoneNumber");
  }
}
