import 'package:flutter/material.dart';

class IncorrectScreen extends StatelessWidget {
  const IncorrectScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'incorrect_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Inscription',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Center(
              child: Text(
                'Vous ne pouvez pas voter',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cinzel'),
              ),
            ),
          ),
        ));
  }
}
