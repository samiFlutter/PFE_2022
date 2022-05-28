//import 'dart:html';

//import 'dart:html';

//import 'dart:js';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projett/screens/acceuil_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // static const String screenRoute ='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void inistate() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AcceuilScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Container(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('images/vote-blue.json'),
                  ),
                  Text(
                    'Bienvenue',
                    style: TextStyle(fontSize: 50, color: Colors.indigo),
                  ),
                  Text(
                    'dans',
                    style: TextStyle(fontSize: 50, color: Colors.indigo),
                  ),
                  Text(
                    'SAWTAK.',
                    style: TextStyle(fontSize: 50, color: Colors.indigo),
                  ),
                ])));
  }
}
