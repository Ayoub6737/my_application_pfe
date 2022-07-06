import 'package:app_gestion_de_vente/screens/command/cmd_Vendeur/cmd_Vendeur.dart';
import 'package:app_gestion_de_vente/screens/command/cmd_client/cmd_Client.dart';
import 'package:flutter/material.dart';

import '../../widget/ServiceBotton.dart';

class Commande extends StatefulWidget {
  const Commande({Key? key}) : super(key: key);

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ServiceBotton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Cmd_Client()));
              },
              title: 'Commandes client',
            ),
            SizedBox(
              height: 10.0,
            ),
            ServiceBotton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Command_Vendeur()));
                },
                title: 'Mes commandes'),
          ],
        ),
      ),
    );
  }
}
