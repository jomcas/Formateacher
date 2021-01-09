import 'package:flutter/material.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';

import 'animation/slideRight.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpPage();
  }
}

class SignUpPage extends StatelessWidget {
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
          Text('Lets Get Started!',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 2.5)),
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 50),
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon:
                                Icon(Icons.lock, size: 50, color: Colors.black),
                            hintText: 'First Name'),
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Password is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Last Name'),
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Password is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                )),
                Divider(),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email, size: 50, color: Colors.black),
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
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.call, size: 50, color: Colors.black),
                        hintText: 'Phone Number'),
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
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideRightRoute(page: BottomNav()),
                          );
                        },
                        color: Colors.blue[400],
                        child: Text('Sign Up',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)))),
                SizedBox(
                    width: 360,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text('Dont have an account yet? Sign Up Here!',
                          style: TextStyle(fontSize: 18)),
                    )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
