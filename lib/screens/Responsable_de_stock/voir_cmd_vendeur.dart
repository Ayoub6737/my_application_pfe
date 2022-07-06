import 'package:app_gestion_de_vente/screens/Responsable_de_stock/verifier_Cmd_Vendeur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class voirCmdVendeur extends StatefulWidget {
  DocumentSnapshot docid;
  voirCmdVendeur({Key? key, required this.docid}) : super(key: key);

  @override
  State<voirCmdVendeur> createState() => _voirCmdVendeurState(docid: docid);
}

class _voirCmdVendeurState extends State<voirCmdVendeur> {
  DocumentSnapshot docid;
  _voirCmdVendeurState({required this.docid});
  TextEditingController date = TextEditingController();

  TextEditingController quantite1 = TextEditingController();

  TextEditingController quantite2 = TextEditingController();

  TextEditingController quantite3 = TextEditingController();
  TextEditingController produit1 = TextEditingController();
  TextEditingController produit2 = TextEditingController();
  TextEditingController produit3 = TextEditingController();
  TextEditingController produit4 = TextEditingController();

  TextEditingController quantite4 = TextEditingController();

  TextEditingController numCmd = TextEditingController();
  @override
  void initState() {
    // getData();
    date = TextEditingController(text: widget.docid.get('date'));
    quantite1 = TextEditingController(text: widget.docid.get('quantite1'));
    quantite2 = TextEditingController(text: widget.docid.get('quantite2'));
    quantite3 = TextEditingController(text: widget.docid.get('quantite3'));
    quantite4 = TextEditingController(text: widget.docid.get('quantite4'));
    produit1 = TextEditingController(text: widget.docid.get('produit1'));
    produit2 = TextEditingController(text: widget.docid.get('produit2'));
    produit3 = TextEditingController(text: widget.docid.get('produit3'));
    produit4 = TextEditingController(text: widget.docid.get('produit4'));
    numCmd = TextEditingController(text: widget.docid.get('num_commande'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.docid.reference.update({
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => verefieCmdVendeur()));
                    });
                  },
                  child: Text(
                    'Valider',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              MaterialButton(
                  color: Colors.red[700],
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => verefieCmdVendeur()));
                  },
                  child: Text('Annuler',
                      style: TextStyle(fontSize: 20, color: Colors.white)))
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: date,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
