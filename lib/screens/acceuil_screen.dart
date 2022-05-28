// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, duplicate_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projett/screens/inscrir_screen.dart';
import 'package:projett/screens/login_screen.dart';
import 'package:projett/screens/login_screen.dart';
import 'package:projett/screens/pagenni_screen.dart';

class AcceuilScreen extends StatelessWidget {
  static const String screenRoute = 'acceuil_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 400, //4e dirtou ane bach ydgade 4e m3a telephone
                  padding: const EdgeInsets.all(20),
                  child: Lottie.asset('images/vote-blue.json'),
                ),
                SizedBox(height: 20),
                FlatButton(
                  color: Colors.blue,
                  child: Text('Inscrir'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InscrirScreen()));
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text('Voter'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pagenni()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class button extends StatelessWidget {
  button({required this.color, required this.title, required this.OnePressed});

  final Color color;
  final String title;
  final VoidCallback OnePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Material(
          elevation: 12,
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          child: MaterialButton(
            onPressed: OnePressed,
            minWidth: 180,
            height: 70,
            child: Text(
              'Inscrir',
              style: TextStyle(
                  color: Colors.black, fontSize: 25, fontFamily: 'Cinzel'),
            ),
          )),
    );
  }
}

class mybutton extends StatelessWidget {
  mybutton(
      {required this.color, required this.title, required this.OnePressed});

  final Color color;
  final String title;
  final Function OnePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 12,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () => OnePressed,
          minWidth: 180,
          height: 70,
          child: Text(
            'Voter',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'cinzel'),
          ),
        ),
      ),
    ));
  }
}*/
