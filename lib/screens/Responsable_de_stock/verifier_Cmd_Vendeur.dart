import 'package:app_gestion_de_vente/screens/Responsable_de_stock/voir_cmd_vendeur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class verefieCmdVendeur extends StatefulWidget {
  const verefieCmdVendeur({Key? key}) : super(key: key);

  @override
  State<verefieCmdVendeur> createState() => _verefieCmdVendeurState();
}

class _verefieCmdVendeurState extends State<verefieCmdVendeur> {
  final CollectionReference Command_VendeurRef =
      FirebaseFirestore.instance.collection('Command de Vendeur');
  Stream<QuerySnapshot> userid = FirebaseFirestore.instance
      .collection('users')
      .where('wrool', isEqualTo: 'Vendeur')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 120, 40),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
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
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => voirCmdVendeur(
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
                    )));
          },
        ));
  }
}
