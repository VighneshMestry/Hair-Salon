import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/features/auth/screens/otp_screen.dart';
import 'package:hair_salon/models/user_model.dart';
import 'package:hair_salon/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _uid;
  String get uid => _uid!;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider() {
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSignIn = prefs.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_signedin", true);
    _isLoading = false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      // _isLoading = true;
      // notifyListeners();
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error);
        },
        codeSent: (verificationId, forceSendingToken) {
          _isLoading = false;
          notifyListeners();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

// FIREBASE OPERATIONS
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("user").doc(_uid).get();

    if (snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
      userModel.uid = uid;
      userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
      _userModel = userModel;

      await _firebaseFirestore
          .collection("users")
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      _userModel = UserModel(
        phoneNumber: documentSnapshot["phoneNumber"],
        uid: documentSnapshot["uid"],
        createdAt: documentSnapshot["createdAt"],
      );
      _uid = userModel.uid;
    });
  }

  //STORING DATA LOCALLY
  Future saveUserDataToSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
      'user_model',
      jsonEncode(
        userModel.toMap(),
      ),
    );
  }

  Future getUserDataFromSP() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user_model") ?? "";
    print(data);
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignIn = false;
    notifyListeners();
    sharedPreferences.clear();
  }
}
