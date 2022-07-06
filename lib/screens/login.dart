import 'package:app_gestion_de_vente/screens/components/mot_Passe_oublie.dart'
    show motPasseOublie;
import 'package:app_gestion_de_vente/screens/home.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String LoginRoute = 'Login_screen';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String txtpassword, txtemail, role;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool isHidePassword = true;


  @override
  Widget build(BuildContext context) {
    void _signIn(String email, String password) async {
      if (formstate.currentState!.validate()) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            AwesomeDialog(
                context: context,
                title: 'Error',
                body: Text('No user found for that email.'),
                dialogType: DialogType.ERROR)
              ..show();
          } else if (e.code == 'wrong-password') {
            AwesomeDialog(
                dialogType: DialogType.ERROR,
                context: context,
                title: 'Error',
                body: Text('Wrong password provided for that user.'))
              ..show();
          }
        }
      }
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 140, 38),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('images/logo.png')),
              ),
              SizedBox(
                height: 150.0,
                child: Center(
                    child: Text(
                  'Bienvenue',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
                )),
              ),
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black, fontSize: 20.2),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 140, 255),
                                    width: 2),
                              ),
                              icon: Icon(
                                Icons.person,
                                size: 38,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 20.0,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black, fontSize: 20.2),
                          obscureText: isHidePassword,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: _toggelPasswordView,
                                child: isHidePassword
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.blue,
                                      ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 140, 255),
                                    width: 2),
                              ),
                              icon: Icon(
                                Icons.lock_open,
                                size: 38,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Mot de passe',
                              hintStyle: TextStyle(
                                fontSize: 20.0,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          _signIn(
                              emailController.text, passwordController.text);
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        color: Color.fromARGB(255, 44, 44, 44),
                        splashColor: Colors.black,
                        height: 50.0,
                        elevation: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => motPasseOublie()));
                            },
                            child: Text(
                              'Mot de pass oublié?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  decoration: TextDecoration.underline),
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  void _toggelPasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
}
