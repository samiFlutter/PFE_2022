// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, prefer_const_constructors, deprecated_member_use, unused_import, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'acceuil_screen.dart';

import 'otp_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var _phoneNember;
  final phoneController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        width: 200,
                        child: Image.asset('images/phone.jpg'),
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: const BorderSide(
                              color: Colors.blueAccent, width: 1.5),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              controller: phoneController,
                              decoration: const InputDecoration(
                                hintText: "Numéro de téléphone",
                              ),
                              keyboardType: TextInputType.phone,
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FlatButton(
                        onPressed: () async {
                          setState(() {
                            _phoneNember = phoneController;
                            showLoading = true;
                          });
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: phoneController.text,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              setState(() {
                                showLoading = false;
                              });
                              setState(() {
                                verificationFailedMessage =
                                    e.message ?? "erreur!";
                              });
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              setState(() {
                                showLoading = false;
                              });
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => OTPPage(
                                      isTimeOut2: false,
                                      verificationId: verificationId)));
                            },
                            timeout: const Duration(seconds: 10),
                            codeAutoRetrievalTimeout: (String verificationId) {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => OTPPage(
                                      isTimeOut2: true,
                                      verificationId: verificationId)));
                            },
                          );
                        },
                        child: const Text("ENVOYER"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ])),
          ),
        ));
  }
}
