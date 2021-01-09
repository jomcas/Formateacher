import 'package:flutter/material.dart';
import 'package:mi_card/routes/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Routes.generateRoute,
    initialRoute: welcome,
  ));
}
