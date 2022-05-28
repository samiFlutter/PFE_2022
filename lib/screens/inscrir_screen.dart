// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cool_alert/cool_alert.dart';

class InscrirScreen extends StatefulWidget {
  const InscrirScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'inscrir_screen';

  @override
  State<InscrirScreen> createState() => _InscrirScreenState();
}

class _InscrirScreenState extends State<InscrirScreen> {
  final nniController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final lieuController = TextEditingController();
  final sexeController = TextEditingController();
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Inscription',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
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
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Saisir votre nom',
                        ),
                        controller: nomController,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Saisir votre prenom',
                        ),
                        controller: prenomController,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Saisir votre Lieu de naissance',
                        ),
                        controller: lieuController,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.5),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Saisir votre sexe',
                        ),
                        controller: sexeController,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                    elevation: 12,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('bdvote').add({
                            'NNI': nniController.value.text,
                            'Nom': nomController.value.text,
                            'Prenom': prenomController.value.text,
                            'Lieu naissance': lieuController.value.text,
                            'Sexe': sexeController.value.text,
                          });
                          Navigator.pop(context);
                          //Navigator.pushNamed(context,  IconScreen.screenRoute);
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            title: 'Sawtak',
                            text: "Vous étes enregistré avec success",
                          );
                        },
                        minWidth: 100,
                        height: 30,
                        child: Text(
                          'Inscrir',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Cinzel'),
                        )))
              ],
            ),
          ),
        ));
  }
}
