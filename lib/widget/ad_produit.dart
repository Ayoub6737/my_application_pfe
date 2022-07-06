// import 'package:app_gestion_de_vente/screens/command/cmd_client/ajoute_cmd_client.dart';


// import 'package:flutter/material.dart';

// class addProduit extends StatefulWidget {
//   addProduit({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<addProduit> createState() => _addProduitState();
// }

// class _addProduitState extends State<addProduit> {
//   var id;
//   TextEditingController prixU = TextEditingController();

//   TextEditingController quantite = TextEditingController();
  
 

 

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         height: 300,
//         width: 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: TextField(
//                 controller: prixU,
//                 textAlign: TextAlign.center,
//                 autofocus: true,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.yellow,
//                           width: 2,
//                           style: BorderStyle.solid),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     label: Text('Produit')),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: TextField(
//                 controller: prixU,
//                 textAlign: TextAlign.center,
//                 autofocus: true,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.yellow,
//                           width: 2,
//                           style: BorderStyle.solid),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     label: Text('Qauntite')),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: TextField(
//                 controller: quantite,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.yellow,
//                           width: 2,
//                           style: BorderStyle.solid),
//                     ),
//                     border: InputBorder.none,
//                     filled: true,
//                     fillColor: Colors.white,
//                     label: Text('Prix')),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MaterialButton(
//                     color: Colors.green[700],
//                     onPressed: () {
                      
//                     },
//                     child: Text(
//                       'Ajouter',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     )),
//                 MaterialButton(
//                     color: Colors.red[700],
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => addCmdClient()));
//                     },
//                     child: Text('Annuler',
//                         style: TextStyle(fontSize: 20, color: Colors.white)))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
    
//   }
//   ajout(){
//       prixU.addListener(() { });
//     }
// }
