import 'package:flutter/material.dart';

// Announce Page
class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 150),
            ),
            CircleAvatar(
              radius: 105,
              backgroundColor: Colors.grey[900],
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
            Text('Contacts Page Solo!',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0)),
          ],
        )));
  }
}
