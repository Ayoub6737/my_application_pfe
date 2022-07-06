import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:app_gestion_de_vente/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D3freres',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
