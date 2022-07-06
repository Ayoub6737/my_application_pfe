import 'package:app_gestion_de_vente/screens/Responsable_de_stock/liste_Vendeur.dart';
import 'package:app_gestion_de_vente/screens/Responsable_de_stock/modifie_mot_pass.dart';
import 'package:app_gestion_de_vente/screens/Responsable_de_stock/Produit/produit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/users.dart';
import '../login.dart';
import '../../widget/ServiceBotton.dart';

// ignore: must_be_immutable
class RespoPage extends StatefulWidget {
  var id;
  RespoPage({required this.id});

  @override
  State<RespoPage> createState() => _RespoPageState(id: id);
}

class _RespoPageState extends State<RespoPage> {
  var id;
  var rooll;
  var emaill;
  var nomRespo;
  var preRespo;
  UserModel loggedInUser = UserModel();
  _RespoPageState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
        nomRespo = loggedInUser.Nom.toString();
        preRespo = loggedInUser.Prenom.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 120, 40),
        title: Row(
          children: [
            Text(
              "${nomRespo}",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 4.2,
            ),
            Text(
              "${preRespo}",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
               AwesomeDialog(
                          context: context,
                          title: 'Attention',
                          body: Column(
                            children: [
                            Text('Voulez-vous vraiment vous déconnecter?',style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                            SizedBox(height: 10.0,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Container(
                                color: Colors.green,
                                child: TextButton(onPressed: (){  logoutRespo(context);}, child: Text("oui",style: TextStyle(color: Colors.white,fontSize: 30))),
                              ),
                              Container(color: Colors.red,
                              child: TextButton(onPressed: (){
                                Navigator.pop(context);
                              },child: Text("No",style: TextStyle(color: Colors.white,fontSize: 30),),),)
                            ],)
                          ],),
                          dialogType: DialogType.WARNING
                          )
                            ..show();
              },
              icon: Icon(
                Icons.logout,
                size: 25,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Votre service',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ServiceBotton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Produit()));
            },
            title: 'Produits',
          ),
          ServiceBotton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => vendeurList(),
                  ),
                );
              },
              title: 'Vendeurs'),
          ServiceBotton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoRespo(),
                  ),
                );
              },
              title: 'Information'),
        ],
      ),
    );
  }

  Future<void> logoutRespo(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
