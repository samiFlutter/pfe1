
// https://www.youtube.com/watch?v=0aX_osJdOz4
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pagenni extends StatefulWidget {
  const Pagenni({Key? key}) : super(key: key);

  @override
  State<Pagenni> createState() => _PagenniState();
}

class _PagenniState extends State<Pagenni> {
  final nniController = TextEditingController();
  bool nni_deja_existe = false;
  late CollectionReference electeurs;
//   // Create a reference to the cities collections
// final citiesRef = db.collection("cities");

// // Create a query against the collection.
// final query = citiesRef.where("state", isEqualTo: "CA");
//   //chercher une doc dans firestore
  Future<bool> chercher_nni(String nni) async {
    electeurs = await FirebaseFirestore.instance.collection('bdvote');

    // StreamBuilder<QuerySnapshot>(
    //     stream: electeurs.snapshots().asBroadcastStream(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (!snapshot.hasData) {
    //         print("pas de donne pour la collection ");
    //         return Container();
    //       } else {
    //         ListView(
    //           children: [
    //             ...snapshot.data!.docs
    //                 .where((QueryDocumentSnapshot<Object?> element) =>
    //                     element['NNI']
    //                         .toString()
    //                         .toLowerCase()
    //                         .contains(nni.toString().toLowerCase()))
    //                 .map((QueryDocumentSnapshot<Object?> data) {

    //                 })
    //           ],
    //         );
    //         return Container();
    //       }
    //     });

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
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
                              // final snapShot = await FirebaseFirestore.instance
                              //     .collection('bdvote')
                              //     .doc('dLvvJXFYkDI8aovidfJx')
                              //     .get()
                              nni_deja_existe =
                                  await chercher_nni(nniController.text);
                              if (nni_deja_existe) {
                                // Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                // MaterialPageRoute(
                                //     builder: (context) => Vote()));
                                // CoolAlert.show(
                                //   context: context,
                                //   type: CoolAlertType.success,
                                //   title: 'Sawtak',
                                //   text: "existe deja votre NNI ",
                                // );
                                print('if');
                              } else {
                                // FirebaseFirestore.instance
                                //     .collection('electeurs')
                                //     .add({
                                //   'NNI': nniController.value.text,
                                // });
                                // Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LogInPage()));
                                // CoolAlert.show(
                                //   context: context,
                                //   type: CoolAlertType.success,
                                //   title: 'Sawtak',
                                //   text: "n'existe pas votre NNI ",
                                // );
                                print("else");
                              }
                            },
                            minWidth: 100,
                            height: 30,
                            child: const Text('Suivant',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontFamily: 'Cinzel')),
                          ))
                    ]))));
  }
}
