import 'package:flutter/material.dart';
import 'package:mi_card/services/auth.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';

// Announce Page
class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 20),
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('images/Avatar.png'),
                backgroundColor: Colors.white,
              ),
            ),
            Text('Jom Cas',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0)),
            SizedBox(height: 50),
            Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contact Information:',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          readOnly: true,
                          initialValue: 'jomarilatigay@live.com',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email,
                                size: 50, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          readOnly: true,
                          initialValue: '09123456789',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone,
                                size: 50, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 25),
            ),
            SizedBox(
                width: 400,
                height: 200,
                child: RaisedButton(
                    onPressed: () {
                      showAlertDialogTwoButtons(
                          context,
                          Icon(Icons.announcement,
                              size: 50, color: Colors.black),
                          'Do you really want to log out?',
                          'CANCEL',
                          'CONTINUE', () async {
                        Navigator.pop(context);
                        await _auth.signOut();
                      });
                    },
                    color: Colors.white,
                    child: Text('Sign out',
                        style: TextStyle(fontSize: 25, color: Colors.red)),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)))),
          ],
        )));
  }
}
