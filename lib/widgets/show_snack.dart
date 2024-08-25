import 'package:flutter/material.dart';

void showSnack(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('$content', style: TextStyle(
            fontSize: 20,
            color: Colors.white
          )
          ),
          backgroundColor: Colors.blue
      ));
}
