import 'package:app_gestion_de_vente/screens/Vendeur/Client/ajout_Client.dart';
import 'package:app_gestion_de_vente/screens/command/cmd_client/cmd_Client.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class editCmdClient extends StatefulWidget {
  DocumentSnapshot docid;
  editCmdClient({required this.docid});

  @override
  _editCmdClientState createState() => _editCmdClientState(docid: docid);
}

class _editCmdClientState extends State<editCmdClient> {
  DocumentSnapshot docid;
  _editCmdClientState({required this.docid});
  TextEditingController date = TextEditingController();
  TextEditingController prixU1 = TextEditingController();

  TextEditingController quantite1 = TextEditingController();
  TextEditingController prixU2 = TextEditingController();

  TextEditingController quantite2 = TextEditingController();
  TextEditingController prixU3 = TextEditingController();
  TextEditingController produit1 = TextEditingController();
  TextEditingController produit2 = TextEditingController();
  TextEditingController produit3 = TextEditingController();
  TextEditingController produit4 = TextEditingController();

  TextEditingController quantite3 = TextEditingController();
  TextEditingController prixU4 = TextEditingController();

  TextEditingController quantite4 = TextEditingController();
  TextEditingController nomClient = TextEditingController();

  TextEditingController numCmd = TextEditingController();
  @override
  void initState() {
    produit1 = TextEditingController(text: widget.docid.get('produit1'));
    prixU1 = TextEditingController(text: widget.docid.get('prixU1'));
    quantite1 = TextEditingController(text: widget.docid.get('quantite1'));
    produit2 = TextEditingController(text: widget.docid.get('produit2'));
    prixU2 = TextEditingController(text: widget.docid.get('prixU2'));
    quantite2 = TextEditingController(text: widget.docid.get('quantite2'));
    produit3 = TextEditingController(text: widget.docid.get('produit3'));
    prixU3 = TextEditingController(text: widget.docid.get('prixU3'));
    quantite3 = TextEditingController(text: widget.docid.get('quantite3'));
    produit4 = TextEditingController(text: widget.docid.get('produit4'));
    prixU4 = TextEditingController(text: widget.docid.get('prixU4'));
    quantite4 = TextEditingController(text: widget.docid.get('quantite4'));
    nomClient = TextEditingController(text: widget.docid.get('nom_client'));
    numCmd = TextEditingController(text: widget.docid.get('Num_commande'));
    date = TextEditingController(text: widget.docid.get('date'));

    super.initState();
  }

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
                      widget.docid.reference.update({
                        'date': date.text,
                        'nom_client': nomClient.text,
                        'num_commande': numCmd.text,
                        'produit1': produit1.text,
                        'quantite1': quantite1.text,
                        'prixU1': prixU1.text,
                        'produit2': produit2.text,
                        'quantite2': quantite2.text,
                        'prixU2': prixU2.text,
                        'produit3': produit3.text,
                        'quantite3': quantite3.text,
                        'prixU3': prixU3.text,
                        'produit4': produit4.text,
                        'quantite4': quantite4.text,
                        'prixU4': prixU4.text,
                        'userid': FirebaseAuth.instance.currentUser?.uid
                      }).whenComplete(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Cmd_Client()));
                      });
                    }
                  },
                  child: Text(
                    'Ajouter',
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
        padding: const EdgeInsets.only(top: 30),
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
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: nomClient,
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
                        labelText: 'Nom de client',
                        suffixIcon: Container(
                          color: Colors.black,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => AddClient()));
                            },
                          ),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 22.0, color: Colors.grey[800])),
                  ),
                ),
                SizedBox(
                  height: 10.0,
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
                      0: FractionColumnWidth(.4),
                      2: FractionColumnWidth(.3),
                      3: FractionColumnWidth(.2),
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
                        Center(
                          child: Text(
                            'Prix Unité',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      ]),
                      TableRow(children: [
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
                        TextField(
                          controller: prixU1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ]),
                      TableRow(children: [
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
                        TextField(
                          controller: prixU2,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ]),
                      TableRow(children: [
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
                        TextField(
                          controller: prixU3,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ]),
                      TableRow(children: [
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
                        TextField(
                          controller: prixU4,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
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
