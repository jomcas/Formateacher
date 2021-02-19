import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/services/auth.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';

// Announce Page

final usersRef = Firestore.instance.collection('UserInfo');

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future getPosts() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    var firestores = Firestore.instance;
    QuerySnapshot qn = await firestores
        .collection("UserInfo")
        .where('UID', isEqualTo: uid)
        .getDocuments();
    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                child: Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 30),
        ),
        CircleAvatar(
          radius: 85,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 85,
            backgroundImage: AssetImage('images/Avatar.png'),
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                return ListView.builder(
                  itemCount: (snapshot.data == null) ? 0 : snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data[index].data["Fname"] ?? "Name", style: TextStyle(fontFamily: 'Inter',
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: 0),
                            ),
                            SizedBox(width: 5),
                            Text(snapshot.data[index].data["Lname"] ?? "Name", style: TextStyle(fontFamily: 'Inter',
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: 0),
                            ),

                          ],
                        ),

                    );
                  },
                );
              }
            },
          ),
        ),
        Container(
            height: 235.0,
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
                  Expanded(
                    child: FutureBuilder(
                      future: getPosts(),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading..."),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: (snapshot.data == null) ? 0 : snapshot.data.length,
                            itemBuilder: (_, index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 360,
                                        child: Row(
                                          children: [
                                            Icon(Icons.email, size: 35, color: Colors.black),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data[index].data["Email"] ?? "Email",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        width: 360,
                                        child: Row(
                                          children: [
                                            Icon(Icons.phone, size: 35, color: Colors.black),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data[index].data["Phone"] ?? "Phone",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
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
            height: 125,
            child: RaisedButton(
                onPressed: () {
                  showAlertDialogTwoButtons(
                      context,
                      Icon(Icons.announcement, size: 50, color: Colors.black),
                      ' Do you really want to log out?',
                      'CANCEL',
                      'CONTINUE', () async {
                    Navigator.pop(context);
                    await auth.signOut();
                  });
                },
                color: Colors.white,
                child: Text('Sign out',
                    style: TextStyle(fontSize: 25, color: Colors.red)),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)))),
      ],
    ))));
  }
}
