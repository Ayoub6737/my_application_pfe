import 'package:app_gestion_de_vente/screens/Responsable_de_stock/Produit/produit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class modifieProduit extends StatefulWidget {
  modifieProduit({Key? key, required this.docid}) : super(key: key);
  DocumentSnapshot docid;
  @override
  State<modifieProduit> createState() => _modifieProduitState(docid: docid);
}

class _modifieProduitState extends State<modifieProduit> {
  DocumentSnapshot docid;
  _modifieProduitState({required this.docid});

  var nomProduit = TextEditingController();
  var referanceProduit = TextEditingController();
  var qntTotal = TextEditingController();
  var prixU = TextEditingController();
  @override
  void initState() {
    nomProduit = TextEditingController(text: widget.docid.get('nom'));
    referanceProduit =
        TextEditingController(text: widget.docid.get('referance'));
    qntTotal = TextEditingController(text: widget.docid.get('quantite'));
    prixU = TextEditingController(text: widget.docid.get('prixU'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Entrez les informations de produit:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.2),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20.2),
                      controller: nomProduit,
                      onSaved: (nomP) {
                        nomProduit.text = nomP!;
                      },
                      validator: (nomP) {
                        if (nomP!.isEmpty) {
                          return "Name of product can't to be empty!!";
                        }

                        if (nomP.length < 1) {
                          return "Name of product cant't to be less than 1 number!!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Nom de Produit',
                          labelStyle: TextStyle(
                              fontSize: 22.0, color: Colors.grey[800])),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.2),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20.2),
                      controller: referanceProduit,
                      onSaved: (ref) {
                        referanceProduit.text = ref!;
                      },
                      validator: (ref) {
                        if (ref!.length > 50) {
                          return "Refrence can't to be larger than 50 letter!!";
                        }

                        if (ref.length < 1) {
                          return "Refrence cant't to be less than 1 letter!!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Referance de Produit',
                          labelStyle: TextStyle(
                              fontSize: 22.0, color: Colors.grey[800])),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.2),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20.2),
                      controller: qntTotal,
                      onSaved: (qn) {
                        qntTotal.text = qn!;
                      },
                      validator: (qn) {
                        if (qn!.isEmpty) {
                          return "Quantity can't to be empty!!";
                        }

                        if (qn.length < 1) {
                          return "Quantity cant't to be less than 1 number!!";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Quntité Total',
                          labelStyle: TextStyle(
                              fontSize: 22.0, color: Colors.grey[800])),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.2),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20.2),
                      controller: prixU,
                      onSaved: (pr) {
                        prixU.text = pr!;
                      },
                      validator: (pr) {
                        if (pr!.length > 50) {
                          return "Price can't to be larger than 50 number!!";
                        }

                        if (pr.length < 1) {
                          return "Price cant't to be less than 4 letter!!";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Prix unité',
                          labelStyle: TextStyle(
                              fontSize: 22.0, color: Colors.grey[800])),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          color: Colors.green[700],
                          onPressed: () {
                            widget.docid.reference.update({
                              'nom': nomProduit.text,
                              'referance': referanceProduit.text,
                              'prixU': prixU.text,
                              'quantite': qntTotal.text
                            }).whenComplete(() {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Produit()));
                            });
                          },
                          child: Text(
                            'Modefier',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      MaterialButton(
                          color: Colors.red[700],
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Produit()));
                          },
                          child: Text('Annuler',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
