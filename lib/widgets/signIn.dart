import 'package:flutter/material.dart';
import 'package:mi_card/widgets/signUp.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignInPage());
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: Scaffold(
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
            Text('Welcome Back!',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0)),
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 50),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon:
                              Icon(Icons.email, size: 50, color: Colors.black),
                          hintText: 'Email'),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Email is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.lock, size: 50, color: Colors.black),
                          hintText: 'Password'),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Password is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Divider(),
                  SizedBox(
                      width: 360,
                      height: 40,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlideRightRoute(page: BottomNav()),
                            );
                          },
                          color: Colors.blue[400],
                          child: Text('Sign In',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)))),
                  SizedBox(
                      width: 360,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideRightRoute(page: SignUp()),
                          );
                        },
                        child: Text('Dont have an account yet? Sign Up Here!',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      )),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
