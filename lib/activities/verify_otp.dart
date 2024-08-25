import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/activities/home_page.dart';
import 'package:firebase_practice/providers/phone_auth_Provider.dart';
import 'package:firebase_practice/widgets/show_snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyOtp extends StatefulWidget {
  final verificationId;
  VerifyOtp({required this.verificationId});
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? otp;
  TextEditingController otpVerify = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<PhoneProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: const Text('OTP Verify',
                style: TextStyle(fontSize: 25, color: Colors.white)),
            backgroundColor: Colors.blue),
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              child: const Text('Verification',
                  style: TextStyle(fontSize: 40, color: Colors.blue))),
          Container(
              alignment: Alignment.center,
              child: const Text('Please enter the verification for checking.',
                  style: TextStyle(fontSize: 19, color: Colors.black45))),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Pinput(
                length: 6,
                showCursor: true,
                controller: otpVerify,
                defaultPinTheme: PinTheme(
                    width: width * 0.18,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.blue)),
                focusedPinTheme: PinTheme(
                  width: width * 0.18,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),

              )),
          const SizedBox(height: 30),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: ElevatedButton(
                  child: otpProvider.isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white))
                      : Text('Verify',
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (otpVerify.text.toString() != '') {
                      verifyOTP(context, otpVerify.text.toString());
                    } else {
                      showSnack(context, 'Enter 6-digit OTP code');
                    }
                  }))
        ])));
  }

  verifyOTP(BuildContext context, String otp) async {
    final ap = Provider.of<PhoneProvider>(context, listen: false);

    ap.verifyOTP(
        context: context,
        smsCode: otpVerify.text.toString(),
        verificationId: widget.verificationId,
        onSuccess: onSuccess);
  }

  void onSuccess() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
