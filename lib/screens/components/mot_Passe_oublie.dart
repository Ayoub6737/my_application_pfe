import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class motPasseOublie extends StatefulWidget {
  const motPasseOublie({Key? key}) : super(key: key);

  @override
  State<motPasseOublie> createState() => _motPasseOublieState();
}

class _motPasseOublieState extends State<motPasseOublie> {
  var _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 122, 34),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Veuillez saisir votre Email',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onSaved: (valu) {},
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 140, 255), width: 2),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
              },
              child: Text(
                'Continuer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
              color: Color.fromARGB(255, 44, 44, 44),
              splashColor: Colors.black,
              height: 50.0,
              elevation: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
