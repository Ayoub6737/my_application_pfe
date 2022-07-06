import 'package:flutter/src/material/dropdown.dart';

class produit {
  String nomP, Ref;
  var QntTotal;
  var prixUnite;

  produit(
      {required this.nomP,
      required this.QntTotal,
      required this.Ref,
      required this.prixUnite});

  static map(DropdownMenuItem<Object> Function(dynamic e) param0) {}
}
