import 'package:app_gestion_de_vente/screens/Vendeur/Client/Client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class modefieClient extends StatefulWidget {
  DocumentSnapshot docid;
  modefieClient({Key? key, required this.docid}) : super(key: key);

  @override
  State<modefieClient> createState() => _modefieClientState(docid: docid);
}

class _modefieClientState extends State<modefieClient> {
  DocumentSnapshot docid;
  _modefieClientState({required this.docid});

  var nomClient = TextEditingController();
  var prenomClient = TextEditingController();
  var adresseClient = TextEditingController();
  var telephonClient = TextEditingController();
  @override
  void initState() {
    prenomClient = TextEditingController(text: widget.docid.get('prenom'));
    adresseClient = TextEditingController(text: widget.docid.get('adresse'));
    telephonClient = TextEditingController(text: widget.docid.get('telephon'));
    nomClient = TextEditingController(text: widget.docid.get('nom'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
        body: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 140, 38),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.2),
                            controller: nomClient,
                            onSaved: (nomC) {
                              nomClient.text = nomC!;
                            },
                            validator: (nomC) {
                              if (nomC!.isEmpty) {
                                return "last name of client can't to be empty!!";
                              }

                              if (nomC.length < 1) {
                                return "last name of client cant't to be less than 1 number!!";
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
                                labelText: 'Nom',
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.2),
                            controller: prenomClient,
                            onSaved: (ref) {
                              prenomClient.text = ref!;
                            },
                            validator: (ref) {
                              if (ref!.length > 50) {
                                return "last name of client can't to be empty!!";
                              }

                              if (ref.length < 1) {
                                return "name of client cant't to be less than 1 letter!!";
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
                                labelText: 'Prenom',
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.2),
                            controller: adresseClient,
                            onSaved: (adr) {
                              adresseClient.text = adr!;
                            },
                            validator: (adr) {
                              if (adr!.isEmpty) {
                                return "Adresse of client can't to be empty!!";
                              }

                              if (adr.length < 1) {
                                return "Adresse of client cant't to be less than 2 letter!!";
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
                                labelText: 'Adresse',
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.2),
                            controller: telephonClient,
                            onSaved: (tlf) {
                              telephonClient.text = tlf!;
                            },
                            validator: (tlf) {
                              if (tlf!.length > 10) {
                                return "Numero can't to be larger than 50 number!!";
                              }

                              if (tlf.length < 1) {
                                return "Numero cant't to be less than 4 number!!";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
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
                                labelText: 'Numéro de Télephon',
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
                                    'nom': nomClient.text,
                                    'prenom': prenomClient.text,
                                    'adresse': adresseClient.text,
                                    'telephon': telephonClient.text
                                  }).whenComplete(() {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Client()));
                                  });
                                },
                                child: Text(
                                  'Modifier',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                            MaterialButton(
                                color: Colors.red[700],
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Annuler',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
