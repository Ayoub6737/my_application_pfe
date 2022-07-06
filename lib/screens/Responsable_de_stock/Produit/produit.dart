import 'package:app_gestion_de_vente/screens/Responsable_de_stock/Produit/ajout_produit.dart';
import 'package:app_gestion_de_vente/screens/Responsable_de_stock/Produit/modifie_produit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Produit extends StatefulWidget {
  const Produit({
    Key? key,
  }) : super(key: key);

  @override
  State<Produit> createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {
  var id;
  final CollectionReference produitRef =
      FirebaseFirestore.instance.collection('Produit');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 120, 40),
          title: Text(
            'Produit',
            style: TextStyle(fontSize: 28.0),
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
                return AddProduit();
              }));
            },
            child: Icon(Icons.add)),
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
        body: FutureBuilder(
          future: produitRef
              .where('userid',
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
                        onDismissed: (direction)  {
                           AwesomeDialog(
                          context: context,
                          title: 'Attention',
                          body: Column(
                            children: [
                            Text('Voulez-vous vraiment supprimer ce produit?',style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                            SizedBox(height: 10.0,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Container(
                                color: Colors.green,
                                child: TextButton(onPressed: ()async{  await FirebaseFirestore.instance
                              .collection("Produit")
                              .doc(snapshot.data!.docs[index].id)
                              .delete();}, child: Text("oui",style: TextStyle(color: Colors.white,fontSize: 30))),
                              ),
                              Container(color: Colors.red,
                              child: TextButton(onPressed: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Produit()));
                              },child: Text("No",style: TextStyle(color: Colors.white,fontSize: 30),),),)
                            ],)
                          ],),
                          dialogType: DialogType.WARNING
                          )
                            ..show();
                        
                        },
                        key: UniqueKey(),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => modifieProduit(
                                        docid: snapshot.data!.docs[index])));
                          },
                          title: Row(
                            children: [
                              Text(
                                snapshot.data!.docChanges[index].doc['nom'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.2,
                              ),
                              Text(
                                '${snapshot.data!.docChanges[index].doc['referance']}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '${snapshot.data!.docChanges[index].doc['prixU']} DH',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '${snapshot.data!.docChanges[index].doc['quantite']} piece',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )));
          },
        ));
  }
}
