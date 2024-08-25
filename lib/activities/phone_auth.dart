import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/providers/phone_auth_Provider.dart';
import 'package:firebase_practice/widgets/phone_auth_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneAuth extends StatefulWidget{
  @override
  _PhoneAuthState createState()=> _PhoneAuthState();
}
class _PhoneAuthState extends State<PhoneAuth>{
  TextEditingController numCont = TextEditingController();

  Country country = Country(
      phoneCode: '880',
      countryCode: 'BD',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Bangladesh',
      example: 'Bangladesh',
      displayName: 'Bangladesh',
      displayNameNoCountryCode: 'BD',
      e164Key: '');

  @override
  Widget build(BuildContext context){
    final provider = Provider.of<PhoneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication', style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        )),
        backgroundColor: Colors.blue
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              alignment: Alignment.center,
              child: const Text('Phone Auth', style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ))
            ),
            const SizedBox(
              height: 30
            ),
            Container(
                padding:const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                child: PhoneAuthInput(numCont: numCont, country:  country,),
            ),
            const SizedBox(
              height: 20
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child:provider.isLoading == true ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white
                  )
                ) : Text('Submit', style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  submitPhone();
                }
              )
            )
          ]
        )
      )
    );
  }
  submitPhone()async{
    final auth = Provider.of<PhoneProvider>(context, listen: false);
    final number = numCont.text.trim();
    auth.submitPhoneNumber(context, '+${country.phoneCode}$number', '+${country.phoneCode}');
  }
}