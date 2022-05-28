import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Vote extends StatefulWidget {
  const Vote({Key? key}) : super(key: key);

  @override
  State<Vote> createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400, //4e dirtou ane bach ydgade 4e m3a telephone
        padding: const EdgeInsets.all(20),
        child: Lottie.asset('images/vote-blue.json'),
      ),
    );
  }
}
