import 'package:app_gestion_de_vente/screens/command/cmd_Vendeur/ajout_cmd_Vendeur.dart';
import 'package:app_gestion_de_vente/screens/command/cmd_Vendeur/modefie_CmdVendeur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Command_Vendeur extends StatefulWidget {
  const Command_Vendeur({
    Key? key,
  }) : super(key: key);

  @override
  State<Command_Vendeur> createState() => _Command_VendeurState();
}

class _Command_VendeurState extends State<Command_Vendeur> {
  final CollectionReference Command_VendeurRef =
      FirebaseFirestore.instance.collection('Command de Vendeur');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 120, 40),
          title: Text(
            'Mes commandes',
            style: TextStyle(fontSize: 25.0),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return addCommand_Vendeur();
              }));
            },
            child: Icon(Icons.add)),
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
        body: FutureBuilder(
          future: Command_VendeurRef.where('userid',
                  isEqualTo: FirebaseAuth.instance.currentUser?.uid)
              .get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Card(
                      color: Colors.yellow,
                      elevation: 8,
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red[700],
                          child: Icon(
                            Icons.delete,
                            size: 40.0,
                          ),
                          padding: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerRight,
                        ),
                        onDismissed: (direction) async {
                          await FirebaseFirestore.instance
                              .collection("Command de Vendeur")
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                        key: UniqueKey(),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => modefie_CmdVendeur(
                                        docid: snapshot.data!.docs[index])));
                          },
                          title: Text(
                            'Commande numèro : ${snapshot.data!.docChanges[index].doc['num_commande']}',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${snapshot.data!.docChanges[index].doc['date']} ',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          // trailing: Icon(Icons.v)
                        ),
                      ),
                    )));
          },
        ));
  }
}
