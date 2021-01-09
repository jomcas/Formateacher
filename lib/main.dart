import 'package:flutter/material.dart';
import 'package:mi_card/routes/routes.dart';

void main() {
  runApp(Formateacher());
}

class Formateacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      //onGenerateRoute: ,
      initialRoute: signIn,
      //home: SignIn()
    );
  }
}
