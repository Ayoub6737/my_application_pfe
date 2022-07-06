import 'package:app_gestion_de_vente/screens/Responsable_de_stock/RespoPage.dart';
import 'package:app_gestion_de_vente/screens/Responsable_de_stock/verifier_Cmd_Vendeur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class vendeurList extends StatefulWidget {
  @override
  _vendeurListState createState() => _vendeurListState();
}

class _vendeurListState extends State<vendeurList> {
  var id;
  Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('wrool', isEqualTo: 'Vendeur')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RespoPage(
                        id: id,
                      )));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
        backgroundColor: Color.fromARGB(255, 255, 120, 40),
        title: Text('Vendeurs'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
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
            itemBuilder: (Context, index) => Card(
              color: Colors.yellow,
              elevation: 8,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => verefieCmdVendeur()));
                },
                title: Center(
                  child: Text(
                    '${snapshot.data!.docChanges[index].doc['Nom']} ${snapshot.data!.docChanges[index].doc['Prenom']}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
