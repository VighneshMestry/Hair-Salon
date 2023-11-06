import 'package:flutter/material.dart';
import 'package:hair_salon/utils/textarea.dart';

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
  final TextEditingController _phoneController = TextEditingController();
  PasswordScreen _passwordScreen = PasswordScreen.hide;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 350, top: 20),
              child: Text(
                "SKIP",
                style: TextStyle(
                    color: Colors.red, decoration: TextDecoration.underline),
              ),
            ),
            Image.asset(
              'assets/hairSalon.png',
              height: 330,
            ),
            const SizedBox(height: 60),
            // const Icon(Icons.person, size: 56),
            if(_passwordScreen == PasswordScreen.hide) 
            Container(
              margin: const EdgeInsets.all(10),
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.grey.shade300)),
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
                        child: CustomTextField(
                            controller: _phoneController,
                            hintText: "Enter your phone"),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 50,
                      width: 320,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _passwordScreen = PasswordScreen.show;
                          });
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
                    const SizedBox(height: 30,),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(text: "By continuing you are agreeing to our \n", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                      TextSpan(text: "Terms & Conditions ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
                      TextSpan(text: "and ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                      TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
                    ]))
                  ],
                ),
              ),
            ),

            if(_passwordScreen == PasswordScreen.show) 
            Container(
              margin: const EdgeInsets.all(10),
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 12),
                child: Column(
                  children: [
                    Image.asset('assets/lockLogo.png'),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                            controller: _phoneController,
                            hintText: "Enter your OTP"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(onPressed: () {}, child: const Text("Resend code in 55 s", style: TextStyle(color: Colors.red),),),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: 320,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _passwordScreen = PasswordScreen.hide;
                          });
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
                    const SizedBox(height: 18,),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(text: "By continuing you are agreeing to our \n", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                      TextSpan(text: "Terms & Conditions ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
                      TextSpan(text: "and ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                      TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400)),
                    ]))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
