import 'package:app_gestion_de_vente/screens/Vendeur/Client/Client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  @override
  Widget build(BuildContext context) {
    var nomClient = TextEditingController();
    var prenomClient = TextEditingController();
    var adresseClient = TextEditingController();
    var telephonClient = TextEditingController();
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    CollectionReference ref = FirebaseFirestore.instance.collection('Client');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      body: SingleChildScrollView(
          child: Form(
        key: formstate,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Entrez les informations du client:',
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
                                  BorderSide(color: Colors.black, width: 1),
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
                        style: TextStyle(color: Colors.black, fontSize: 20.2),
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
                                  BorderSide(color: Colors.black, width: 1),
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
                        style: TextStyle(color: Colors.black, fontSize: 20.2),
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
                                  BorderSide(color: Colors.black, width: 1),
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
                        style: TextStyle(color: Colors.black, fontSize: 20.2),
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
                                  BorderSide(color: Colors.black, width: 1),
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
                              if (formstate.currentState!.validate()) {
                                ref.add({
                                  'nom': nomClient.text,
                                  'prenom': prenomClient.text,
                                  'adresse': adresseClient.text,
                                  'telephon': telephonClient.text,
                                  'userid':
                                      FirebaseAuth.instance.currentUser?.uid
                                }).whenComplete(() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Client()));
                                });
                              } else
                                return null;
                            },
                            child: Text(
                              'Ajouter',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
        ),
      )),
    );
  }
}
