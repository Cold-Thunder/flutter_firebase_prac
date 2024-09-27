import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState()=> _LogInState();
}

class _LogInState extends State<LogIn>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn', style: TextStyle(
          fontSize: 24,
          color: Colors.white
        ))
      ),
      body: SafeArea(child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LogIn', style: TextStyle(
              fontSize: 30,
              color: Colors.blue
            ))
          ],
        )
      ))
    );
  }
}