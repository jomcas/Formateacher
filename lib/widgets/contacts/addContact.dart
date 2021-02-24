import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/animation/slideRight.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';
import 'package:mi_card/widgets/signUp.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String number = "";

  //Add recipient name and number to database
  Map data;

  addPhoneNumber() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    Map<String, dynamic> recipientData = {
      "UID": uid,
      "name": name,
      "phone": number,
    };

    CollectionReference collectionReference =
        Firestore.instance.collection('RecipientInfo');
    collectionReference.add(recipientData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              SlideRightRoute(page: BottomNav()),
            );
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
            padding: const EdgeInsets.only(top: 5),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 100),
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/add.png"),
                    fit: BoxFit.fitHeight)),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Add Contacts',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 0)),
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 10),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Divider(),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          inputFile(
                              controller: nameController,
                              label: "Name:",
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Recipient Name' : null,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              }),
                          inputFile(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              label: "Phone Number:",
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Phone Number' : null,
                              onChanged: (val) {
                                setState(() {
                                  number = val;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 300,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addPhoneNumber();
                        showAlertDialogOneButton(context, Icon(Icons.info),
                            "Added Contact Successfully!", "Ok");
                      }

                      setState(() {
                        nameController.clear();
                        phoneController.clear();
                      });
                    },
                    color: Colors.blueGrey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Add",
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
//                    child: FlatButton(
//                      onPressed: () {},
//                      child: Text('Select From Contacts',
//                          style: TextStyle(
//                              fontSize: 16, fontWeight: FontWeight.w700)),
//                    )
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
