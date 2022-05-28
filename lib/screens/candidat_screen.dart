import 'package:flutter/material.dart';
import 'package:projett/screens/vote.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'icon_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150), color: Colors.blue),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/aziz.jpg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mohamed Ould AbdelAziz',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Vote()));
                          },
                          minWidth: 60,
                          height: 30,
                          child: Text('Voter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Cinzel',
                              ))),
                    ),
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.deepPurpleAccent),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/ghawani.jpg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mohamed Ould Ghazwani',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                          onPressed: () {},
                          minWidth: 60,
                          height: 30,
                          child: Text('Voter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Cinzel',
                              ))),
                    ),
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.indigoAccent),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/hanena.jpg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hannena Ould Sidi',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                          onPressed: () {},
                          minWidth: 60,
                          height: 30,
                          child: Text('Voter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Cinzel',
                              ))),
                    ),
                  ]),
            )
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
      ),
    );
  }
}
