import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/services/auth.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';
import 'package:mi_card/widgets/shared/loading.dart';
import 'package:mi_card/widgets/signIn.dart';

import 'animation/slideRight.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  String lname = '';
  String fname = '';
  String email = '';
  String password = '';
  String phone = '';

  //Add data to database firestore
  Map data;

  addData() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    Map<String, dynamic> demoData = {
      "Lname": lname,
      "Fname": fname,
      "Email": email,
      "Password": password,
      "Phone": phone,
    };
    //CollectionReference collectionReference =
    Firestore.instance.collection('UserInfo').document(uid).setData(demoData);
    //collectionReference.add(demoData);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                      SizedBox(
                        width: 400,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                inputFile(
                                    label: "Last Name:",
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter Last Name' : null,
                                    onChanged: (val) {
                                      setState(() {
                                        lname = val;
                                      });
                                    }),
                                inputFile(
                                    label: "First Name:",
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter First Name' : null,
                                    onChanged: (val) {
                                      setState(() {
                                        fname = val;
                                      });
                                    }),
                                inputFile(
                                    label: "Email:",
                                    validator: (val) => val.isEmpty
                                        ? 'Enter Your Email Address'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                                inputFile(
                                    label: "Password:",
                                    validator: (val) => val.length < 6
                                        ? 'Enter Password minimum of 6 characters'
                                        : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                                inputFile(
                                    label: "Phone Number:",
                                    validator: (val) => val.isEmpty
                                        ? 'Enter Phone Number'
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        phone = val;
                                      });
                                    }),
                              ],
                            ),
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign up with those credentials';
                                  loading = false;
                                  showAlertDialogOneButton(
                                      context, Icon(Icons.error), error, 'OK');
                                });
                              } else {
                                showAlertDialogOneButton(
                                    context,
                                    Icon(Icons.info),
                                    "Registered Successfully!",
                                    'OK');
                                Navigator.pop(context);
                                loading = false;
                                addData();
                              }
                            }
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
                                SlideRightRoute(page: SignIn()),
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
          );
  }
}

//Text Widget
Widget inputFile(
    {label,
    obscureText = false,
    onChanged,
    onTap,
    validator,
    labelhint,
    initialvalue,
    readOnly = false}) {
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
      TextFormField(
        initialValue: initialvalue,
        readOnly: readOnly,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: labelhint,
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

Widget dropdown(
    {label, valuechoose, List listitem, onChanged, valueItem, labelhint}) {
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
      Container(
        padding: EdgeInsets.only(left: 10, right: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400], width: 1),
        ),
        child: DropdownButton(
          hint: labelhint,
          value: valuechoose,
          onChanged: onChanged,
          dropdownColor: Colors.grey[200],
          iconSize: 36,
          isExpanded: true,
          items: listitem.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
