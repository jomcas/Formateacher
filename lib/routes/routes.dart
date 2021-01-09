import 'package:flutter/material.dart';
import 'package:mi_card/widgets/signIn.dart';
import 'package:mi_card/widgets/signUp.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';
import 'package:mi_card/widgets/contacts/addContact.dart';

const String home = '/';
const String signIn = '/signIn';
const String signUp = '/signUp';
const String addContact = '/addContact';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => BottomNav());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignIn());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case addContact:
        return MaterialPageRoute(builder: (_) => AddContact());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
