import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InfoRespo extends StatefulWidget {
  const InfoRespo({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoRespo> createState() => _InfoRespoState();
}

class _InfoRespoState extends State<InfoRespo> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var motPassActuel = TextEditingController();
  var nvMotPass = TextEditingController();
  var cfNmotPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 140, 38),
      body: SafeArea(
          child: Form(
        key: formstate,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Modifiez votre mot de pass ici',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: TextFormField(
                    validator: (val) {},
                    onSaved: (val) {},
                    controller: motPassActuel,
                    style: TextStyle(color: Colors.black, fontSize: 20.2),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Mot de passe actuel',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.grey[800])),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: TextFormField(
                    validator: (val) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (val!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (!regex.hasMatch(val)) {
                        return ("please enter valid password min. 6 character");
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      nvMotPass.text = val!;
                    },
                    controller: nvMotPass,
                    style: TextStyle(color: Colors.black, fontSize: 20.2),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nouveau mot de passe',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.grey[800])),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: TextFormField(
                    validator: (val) {
                      if (nvMotPass != cfNmotPass) {
                        return '';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      cfNmotPass.text = val!;
                    },
                    controller: cfNmotPass,
                    style: TextStyle(color: Colors.black, fontSize: 20.2),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirmer le nouveau mot de passe',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.grey[800])),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: Colors.green[700],
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            FirebaseAuth.instance.currentUser
                                ?.updatePassword('${nvMotPass}');
                          } else
                            return null;
                        },
                        child: Text(
                          'Modifié',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                    MaterialButton(
                        color: Colors.red[700],
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Annuler',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
