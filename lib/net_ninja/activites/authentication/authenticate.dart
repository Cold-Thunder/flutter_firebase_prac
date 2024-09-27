import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget{
  @override
  State<Authenticate> createState()=> _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            child: const Text('Authentication Page')
          )
        )
      )
    );
  }
}