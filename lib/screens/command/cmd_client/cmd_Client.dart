import 'package:app_gestion_de_vente/screens/command/cmd_client/ajoute_cmd_client.dart';
import 'package:app_gestion_de_vente/screens/command/command.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'modefie_cmd_client.dart';

class Cmd_Client extends StatefulWidget {
  const Cmd_Client({Key? key}) : super(key: key);

  @override
  State<Cmd_Client> createState() => _Cmd_ClientState();
}

class _Cmd_ClientState extends State<Cmd_Client> {
  final CollectionReference Command_VendeurRef =
      FirebaseFirestore.instance.collection('Commande de Client');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commandes Clients'),
        backgroundColor: Color.fromARGB(255, 255, 120, 40),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Commande()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
      ),
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => addCmdClient()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder(
        future: Command_VendeurRef.where('userid',
                isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            .collection("Commande de Client")
                            .doc(snapshot.data!.docs[index].id)
                            .delete();
                      },
                      key: UniqueKey(),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => editCmdClient(
                                      docid: snapshot.data!.docs[index])));
                        },
                        title: Text(
                          'Commande numèro : ${snapshot.data!.docChanges[index].doc['num_commande']}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${snapshot.data!.docChanges[index].doc['nom_client']} ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '${snapshot.data!.docChanges[index].doc['date']} ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )));
        },
      ),
    );
  }
}
