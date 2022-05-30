import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pfe/screens/inscrir_screen.dart';
import 'package:pfe/screens/pagenni_screen.dart';

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
                            builder: (context) => const InscrirScreen()));
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