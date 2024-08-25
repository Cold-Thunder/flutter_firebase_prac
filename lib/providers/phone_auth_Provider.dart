import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/activities/phone_auth.dart';
import 'package:firebase_practice/activities/verify_otp.dart';
import 'package:firebase_practice/widgets/show_snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneProvider extends ChangeNotifier {
  bool a;
  bool isLoading;
  bool isLogin;
  String number;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  PhoneProvider({
    this.a = false,
    this.number = '',
    this.isLogin = false,
    this.isLoading = false,
  });

  void changeNumber(String numb) {
    number = numb;
  }

  void checkLogin()async{
    
  }

  void submitPhoneNumber(
      BuildContext context, String number, String phoneCode) async {
    isLoading = true;
    notifyListeners();
    try {
      if (number == phoneCode) {
        showSnack(context, 'Please enter your number!');
      } else {
        await firebaseAuth.verifyPhoneNumber(
            verificationCompleted: (PhoneAuthCredential credential) async {
              await firebaseAuth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException ex) {
              showSnack(context, ex.message.toString());
            },
            codeSent: (String verificationId, int? token) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VerifyOtp(verificationId: verificationId)));
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
            phoneNumber: number);
      }
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (err) {
      showSnack(context, err.message.toString());
    }
    notifyListeners();
  }

  void verifyOTP(
      {required BuildContext context,
      required String smsCode,
      required String verificationId,
      required Function onSuccess}) async {
    isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await firebaseAuth.signInWithCredential(cred).then((value) {
        onSuccess();
      });
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (err) {
      print(err.message.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void signOut(BuildContext context)async{
    await firebaseAuth.signOut();
    notifyListeners();
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=> PhoneAuth())
    );
  }
}
