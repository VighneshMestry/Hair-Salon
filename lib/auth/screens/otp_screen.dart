import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  String? otp;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                    border:
                        Border.all(width: 1.0, color: Colors.grey.shade300)),
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
                            border: Border(bottom: BorderSide(width: 1.0, color: Colors.black))
                          ),
                          textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        onSubmitted: (value) {
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
                          onPressed: () {},
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
}

// Container(
//                   margin: const EdgeInsets.all(10),
//                   height: 350,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       border:
//                           Border.all(width: 1.0, color: Colors.grey.shade300)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 12, right: 12, top: 12, bottom: 12),
//                     child: Column(
//                       children: [
//                         Image.asset('assets/lockLogo.png'),
//                         const SizedBox(height: 45),
//                         SizedBox(
//                           width: 350,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CustomTextField(
//                                 controller: otpController,
//                                 hintText: "Enter your OTP"),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "Resend code in 55 s",
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         SizedBox(
//                           height: 50,
//                           width: 320,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 _passwordScreen = PasswordScreen.hide;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 27, 78, 165),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             child: const Text(
//                               "CONTINUE",
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 18,
//                         ),
//                         RichText(
//                             text: const TextSpan(children: [
//                           TextSpan(
//                               text: "By continuing you are agreeing to our \n",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400)),
//                           TextSpan(
//                               text: "Terms & Conditions ",
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.w400)),
//                           TextSpan(
//                               text: "and ",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400)),
//                           TextSpan(
//                               text: "Privacy Policy",
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.w400)),
//                         ]))
//                       ],
//                     ),
//                   ),
//                 ),