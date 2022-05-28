// ignore_for_file: prefer_const_constructors, unnecessary_import, duplicate_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projett/screens/acceuil_screen.dart';
import 'package:projett/screens/inscrir_screen.dart';
import 'package:projett/screens/login_screen.dart';
import 'package:projett/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AcceuilScreen());
  }
}
