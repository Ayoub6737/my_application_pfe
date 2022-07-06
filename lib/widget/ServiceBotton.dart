import 'package:flutter/material.dart';

class ServiceBotton extends StatelessWidget {
  ServiceBotton({required this.onPressed, required this.title});
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.2),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          child: MaterialButton(
              onPressed: () => onPressed(),
              minWidth: 200.0,
              height: 100.0,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              )),
        ));
  }
}
