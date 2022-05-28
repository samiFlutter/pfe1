import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class InscrirScreen extends StatefulWidget {
  const InscrirScreen({Key? key}) : super(key: key);

  @override
  State<InscrirScreen> createState() => _InscrirScreenState();
}

class _InscrirScreenState extends State<InscrirScreen> {
//text editing controller variables
  final nniController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final lieuController = TextEditingController();
  final sexeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Inscription',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              My_ListTile(
                controller: nniController,
                text_var: 'Saisir votre NNI',
              ),
              const SizedBox(height: 20),
              My_ListTile(
                controller: nomController,
                text_var: 'Saisir votre nom',
              ),
              const SizedBox(height: 20),
              My_ListTile(
                controller: prenomController,
                text_var: 'Saisir votre prenom',
              ),
              const SizedBox(height: 20),
              My_ListTile(
                controller: lieuController,
                text_var: 'Saisir votre Lieu de naissance',
              ),
              const SizedBox(height: 20),
              My_ListTile(
                controller: sexeController,
                text_var: 'Saisir votre sexe',
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 12,
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  onPressed: () {
                    
                    Navigator.pop(context);
                    CoolAlert.show(
                      type: CoolAlertType.success,
                      context: context,
                      title: 'Sawtak',
                      text: "Vous étes enregistré avec success",
                    );
                  },
                  minWidth: 100,
                  height: 30,
                  child: const Text(
                    'Inscrir',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Cinzel'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//because we have 4 list tiles we need to create a class for each one
class My_ListTile extends Widget {
  TextEditingController controller;
  String? text_var;
  My_ListTile({Key? key, required this.controller, this.text_var})
      : super(key: key);

  @override
  Element createElement() {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          )),
      title: Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text_var,
            ),
          ))
        ],
      ),
    ).createElement();
  }
}
