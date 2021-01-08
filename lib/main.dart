import 'package:flutter/material.dart';
import 'package:mi_card/widgets/signIn.dart';

void main() {
  runApp(Formateacher());
}

class Formateacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(fontFamily: 'Inter'), home: SignIn());
  }
}
