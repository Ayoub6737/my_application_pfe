import 'package:app_gestion_de_vente/screens/Vendeur/Client/ajout_Client.dart';
import 'package:app_gestion_de_vente/screens/Vendeur/Client/modifie_Client.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  final CollectionReference clientref =
      FirebaseFirestore.instance.collection('Client');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 120, 40),
          title: Text(
            'Mes Clients',
            style: TextStyle(fontSize: 28.0),
          ),
          centerTitle: true,
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
            elevation: 10,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddClient();
              }));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
        body: FutureBuilder(
            future: clientref
                .where('userid',
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      borderOnForeground: false,
                      color: Colors.yellow,
                      elevation: 6,
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red[700],
                          child: Icon(
                            Icons.delete,
                            size: 45.0,
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
                            Text('Voulez-vous vraiment supprimer ce client?',style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                            SizedBox(height: 10.0,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Container(
                                color: Colors.green,
                                child: TextButton(onPressed: ()async{  await FirebaseFirestore.instance
                                .collection("Client")
                                .doc(snapshot.data!.docs[index].id)
                                .delete();}, child: Text("oui",style: TextStyle(color: Colors.white,fontSize: 30))),
                              ),
                              Container(color: Colors.red,
                              child: TextButton(onPressed: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Client()));
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => modefieClient(
                                    docid: snapshot.data!.docs[index])));
                          },
                          title: Text(
                            '${snapshot.data!.docChanges[index].doc['nom']} ${snapshot.data!.docChanges[index].doc['prenom']}',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${snapshot.data!.docChanges[index].doc['telephon']}',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '${snapshot.data!.docChanges[index].doc['adresse']}',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              );
            }));
  }
}
