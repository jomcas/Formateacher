import 'package:flutter/material.dart';
import 'package:mi_card/services/auth.dart';
import 'package:mi_card/widgets/shared/loading.dart';
import 'package:mi_card/widgets/signUp.dart';
import 'animation/slideRight.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  String email = '';
  String password = '';

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
                  padding: const EdgeInsets.only(top: 10),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.fitHeight)),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome Back!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(top: 10),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: <Widget>[
                                inputFile(
                                    label: "Email:",
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                                inputFile(
                                    label: "Password:",
                                    validator: (val) => val.length < 6
                                        ? 'Enter a password 6+ chars long'
                                        : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          width: 335,
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              // May bug na kapag mali yung login mapupunta sa welcome aayisin pa

                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);

                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                Navigator.pop(context);
                                loading = false;
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not sign in with those credentials';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            color: Color(0xff0795A8),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 360,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlideRightRoute(page: SignUp()),
                                );
                              },
                              child: Text('Dont have an account? Sign Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            )),
                        SizedBox(
                            width: 360,
                            child: FlatButton(
                              onPressed: () async {
                                dynamic result = await _auth.signInAnon();
                                Navigator.pop(context);
                                if (result == null) {
                                  print('error signing in');
                                } else {
                                  print('signed in');
                                  print(result.uid);
                                }
                              },
                              child: Text('Sign In Anonymously',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )),
          );
  }
}
