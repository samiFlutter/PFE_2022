import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:projett/screens/inscrir_screen.dart';
import 'package:projett/screens/login_screen.dart';
import 'package:projett/screens/vote.dart';

class Pagenni extends StatefulWidget {
  const Pagenni({Key? key}) : super(key: key);
  static const String screenRoute = 'pagenni_screen';

  @override
  State<Pagenni> createState() => _PagenniState();
}

class _PagenniState extends State<Pagenni> {
  final nniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 100,
                      child: Image.asset('images/icon-bring.png'),
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
                              child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Saisir votre NNI',
                            ),
                            controller: nniController,
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                        elevation: 12,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        child: MaterialButton(
                          onPressed: () async {
                            final snapShot = await FirebaseFirestore.instance
                                .collection('electeurs')
                                .doc('NNI')
                                .get();
                            if (!snapShot.exists) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Vote()));
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: 'Sawtak',
                                text:
                                    "Vous ne pas étes enregistré avec success",
                              );
                            } else {
                              FirebaseFirestore.instance
                                  .collection('electeurs')
                                  .add({
                                'NNI': nniController.value.text,
                              });
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInPage()));
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: 'Sawtak',
                                text: "Vous étes enregistré avec success",
                              );
                            }
                          },
                          minWidth: 100,
                          height: 30,
                          child: Text('Suivant',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: 'Cinzel')),
                        ))
                  ])),
        ));
  }
}
