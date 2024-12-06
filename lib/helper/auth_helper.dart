import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  static String verificationMyId = "";

  Future<void> phoneVerification({required String number}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$number",
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == "invalid-phone-number") {
          log("Phone Number is Invalid Please check.....");
        } else {
          log("ERROR : ${error.code}");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationMyId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<Map<String, dynamic>> checkMyOTP({required String otp}) async {
    Map<String, dynamic> res = {};
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationMyId, smsCode: otp);

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      res['user'] = user;
    } catch (e) {
      log("ERROR : $e");
      res['error'] = e;
    }

    return res;
  }
}
