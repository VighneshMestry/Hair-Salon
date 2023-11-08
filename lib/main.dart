import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/auth/screens/get_started_screen.dart';
import 'package:hair_salon/firebase_options.dart';
import 'package:hair_salon/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Hair Salon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: FutureBuilder(builder: (context, snapshot) {
        //   if(snapshot.hasData == false){
        //     const LoginScreen();
        //   } else {
        //     const HomeScreen();
        //   }
        //   const LoginScreen();
        // }, future: authProvider.isSignIn ,)
        home: const GetStarted(),
      ),
    );
  }
}

// isSignIn == false
//             ? Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => LoginScreen()))
//             : Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomeScreen(),
//                 ),
//               ),
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );