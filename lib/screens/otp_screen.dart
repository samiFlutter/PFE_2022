// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, deprecated_member_use, unused_import, unnecessary_import, use_key_in_widget_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:projett/screens/acceuil_screen.dart';
import 'package:projett/screens/candidat_screen.dart';
import 'package:projett/screens/pagenni_screen.dart';
import 'package:projett/screens/vote.dart';

class OTPPage extends StatefulWidget {
  OTPPage({required this.verificationId, required this.isTimeOut2});
  final String verificationId;
  final bool isTimeOut2;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final otpController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  String myVerificationId = "";
  bool isTimeOut = false;

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    myVerificationId = widget.verificationId;
    isTimeOut = widget.isTimeOut2;
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      // height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset("images/g.png"), //
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            text: "Entrer votre code ",
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 6) {
                                return " Vous devez entre le SMS code";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            errorAnimationController: errorController,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.white,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                          )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: RaisedButton(
                          onPressed: () async {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: myVerificationId,
                                    smsCode: otpController.text);
                            // Sign the user in (or link) with the credential
                            await auth.signInWithCredential(credential);
                            if (auth.currentUser != null) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => Pagenni()));
                            }
                          },
                          child: Center(
                              child: Text(
                            "Veriver".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: Offset(1, -2),
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.green.shade200,
                                offset: Offset(-1, 2),
                                blurRadius: 5)
                          ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      verificationFailedMessage,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
