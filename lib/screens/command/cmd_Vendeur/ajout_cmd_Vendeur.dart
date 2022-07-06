import 'package:app_gestion_de_vente/screens/command/cmd_client/cmd_Client.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class addCommand_Vendeur extends StatefulWidget {
  @override
  State<addCommand_Vendeur> createState() => _addCommand_VendeurState();
}

class _addCommand_VendeurState extends State<addCommand_Vendeur> {
  TextEditingController date = TextEditingController();

  TextEditingController quantite1 = TextEditingController();

  TextEditingController quantite2 = TextEditingController();

  TextEditingController quantite3 = TextEditingController();

  TextEditingController quantite4 = TextEditingController();
  TextEditingController produit1 = TextEditingController();
  TextEditingController produit2 = TextEditingController();
  TextEditingController produit3 = TextEditingController();
  TextEditingController produit4 = TextEditingController();

  TextEditingController numCmd = TextEditingController();
  // List produit = [];
  // var selectProd;
  // var selectProd1;
  // var selectProd2;
  // var selectProd3;

  // final CollectionReference prod =
  //     FirebaseFirestore.instance.collection('Produit');

  // getData() async {
  //   var respo = await prod.get();
  //   respo.docs.forEach((element) {
  //     setState(() {
  //       produit.add(element.data());
  //     });
  //   });
  // }

  CollectionReference cmdVendeur =
      FirebaseFirestore.instance.collection('Command de Vendeur');

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 120, 40),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  color: Colors.green[700],
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      cmdVendeur.add({
                        'date': date.text,
                        'num_commande': numCmd.text,
                        'produit1': produit1.text,
                        'quantite1': quantite1.text,
                        'produit2': produit2.text,
                        'quantite2': quantite2.text,
                        'produit3': produit3.text,
                        'quantite3': quantite3.text,
                        'produit4': produit4.text,
                        'quantite4': quantite4.text,
                        'userid': FirebaseAuth.instance.currentUser?.uid
                      }).whenComplete(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Cmd_Client()));
                      });
                    }
                  },
                  child: Text(
                    'Envoyer',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              MaterialButton(
                  color: Colors.red[700],
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Cmd_Client()));
                  },
                  child: Text('Annuler',
                      style: TextStyle(fontSize: 20, color: Colors.white)))
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: date,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Date',
                        labelStyle:
                            TextStyle(fontSize: 22.0, color: Colors.grey[800])),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numCmd,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Numéro de Command',
                        labelStyle:
                            TextStyle(fontSize: 22.0, color: Colors.grey[800])),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      horizontalInside: BorderSide(color: Colors.black),
                      verticalInside: BorderSide(color: Colors.black),
                    ),
                    columnWidths: {
                      0: FractionColumnWidth(.6),
                      2: FractionColumnWidth(.2),
                    },
                    children: [
                      TableRow(children: [
                        Center(
                          child: Text(
                            'Produit',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Qauntité',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        // Center(
                        //   child: DropdownButton(
                        //       alignment: Alignment.center,
                        //       borderRadius: BorderRadius.zero,
                        //       hint: Text('Produit'),
                        //       value: selectProd,
                        //       items: produit
                        //           .map((prod) => DropdownMenuItem(
                        //                 child: Row(
                        //                   children: [
                        //                     Text(prod['nom']),
                        //                     SizedBox(
                        //                       width: 6,
                        //                     ),
                        //                     Text(prod['referance'])
                        //                   ],
                        //                 ),
                        //                 value: prod['nom'],
                        //               ))
                        //           .toList(),
                        //       onChanged: (val) {
                        //         setState(() {
                        //           selectProd = val;
                        //         });
                        //       }),
                        // ),
                        TextField(
                          controller: produit1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: quantite1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        // Center(
                        //   child: DropdownButton(
                        //       alignment: Alignment.center,
                        //       borderRadius: BorderRadius.zero,
                        //       hint: Text('Produit'),
                        //       value: selectProd1,
                        //       items: produit
                        //           .map((prod) => DropdownMenuItem(
                        //                 child: Row(
                        //                   children: [
                        //                     Text(prod['nom']),
                        //                     SizedBox(
                        //                       width: 6,
                        //                     ),
                        //                     Text(prod['referance'])
                        //                   ],
                        //                 ),
                        //                 value: prod['nom'],
                        //               ))
                        //           .toList(),
                        //       onChanged: (val) {
                        //         setState(() {
                        //           selectProd1 = val;
                        //         });
                        //       }),
                        // ),
                        TextField(
                          controller: produit2,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: quantite2,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        // Center(
                        //   child: DropdownButton(
                        //       alignment: Alignment.center,
                        //       borderRadius: BorderRadius.zero,
                        //       hint: Text('Produit'),
                        //       value: selectProd2,
                        //       items: produit
                        //           .map((prod) => DropdownMenuItem(
                        //                 child: Row(
                        //                   children: [
                        //                     Text(prod['nom']),
                        //                     SizedBox(
                        //                       width: 6,
                        //                     ),
                        //                     Text(prod['referance'])
                        //                   ],
                        //                 ),
                        //                 value: prod['nom'],
                        //               ))
                        //           .toList(),
                        //       onChanged: (val) {
                        //         setState(() {
                        //           selectProd2 = val;
                        //         });
                        //       }),
                        // ),
                        TextField(
                          controller: produit3,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: quantite3,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        // Center(
                        //   child: DropdownButton(
                        //       alignment: Alignment.center,
                        //       borderRadius: BorderRadius.zero,
                        //       hint: Text('Produit'),
                        //       value: selectProd3,
                        //       items: produit
                        //           .map((prod) => DropdownMenuItem(
                        //                 child: Row(
                        //                   children: [
                        //                     Text(prod['nom']),
                        //                     SizedBox(
                        //                       width: 6,
                        //                     ),
                        //                     Text(prod['referance'])
                        //                   ],
                        //                 ),
                        //                 value: prod['nom'],
                        //               ))
                        //           .toList(),
                        //       onChanged: (val) {
                        //         setState(() {
                        //           selectProd3 = val;
                        //         });
                        //       }),
                        // ),
                        TextField(
                          controller: produit4,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: quantite4,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Center(
                //   child: Container(
                //     color: Colors.black,
                //     child: IconButton(
                //       onPressed: () {
                //         showDialog(
                //             context: context,
                //             builder: (context) => addProduit());
                //       },
                //       icon: Icon(
                //         Icons.add,
                //         size: 30,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
