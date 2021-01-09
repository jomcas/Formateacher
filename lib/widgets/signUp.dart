import 'package:flutter/material.dart';
import 'package:mi_card/widgets/signIn.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';
import 'package:mi_card/main.dart';

import 'animation/slideRight.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpPage());
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Formateacher()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 0),
            ),
            Text("Let's Get Started!",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2.5)),
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 10),
            ),
            Container(
              child: Column(
                children: <Widget>[
//                  SizedBox(
//                      child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
////                      SizedBox(
////                        width: 180,
////                        child: TextFormField(
////                          decoration: InputDecoration(
////                              border: InputBorder.none,
////                              icon: Icon(Icons.lock,
////                                  size: 50, color: Colors.black),
////                              hintText: 'First Name'),
////                          validator: (String value) {
////                            if (value.trim().isEmpty) {
////                              return 'Password is required';
////                            } else {
////                              return null;
////                            }
////                          },
////                        ),
////                      ),
////                      SizedBox(
////                        width: 180,
////                        child: TextFormField(
////                          decoration: InputDecoration(
////                              border: InputBorder.none, hintText: 'Last Name'),
////                          validator: (String value) {
////                            if (value.trim().isEmpty) {
////                              return 'Password is required';
////                            } else {
////                              return null;
////                            }
////                          },
////                        ),
////                      ),
//                    ],
//                  )),

                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          inputFile(label: "Last Name:"),
                          inputFile(label: "First Name:"),
                          inputFile(label: "Email:"),
                          inputFile(label: "Password:", obscureText: true),
                          inputFile(label: "Phone Number:"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNav()),
                        );
                      },
                      color: Color(0xff0795A8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                      width: 360,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideRightRoute(page: SignInPage()),
                          );
                        },
                        child: Text('Alreday have an account? Sign In',
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

//Text Widget
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
