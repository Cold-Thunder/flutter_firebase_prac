import 'package:firebase_practice/activities/phone_auth.dart';
import 'package:firebase_practice/providers/phone_auth_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    final _authProvider = Provider.of<PhoneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(
          fontSize: 25,
          color: Colors.white
        )),
        backgroundColor: Colors.blue
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: _authProvider.isLoading == true ?
                CircularProgressIndicator(
                  color: Colors.blue
                ) :
                Text('Log Out', style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: (){
                    _authProvider.signOut(context);
                }
              )
            )
          ]
        )
      )
    );
  }
}