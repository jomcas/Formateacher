import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/signUp.dart';


class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  String name = "";
  String number = "";

  //Add recipient name and number to database
  Map data;

  addPhoneNumber() {
    Map<String, dynamic> RecipientData = {
      "name": name,
      "phone": number,
    };
    CollectionReference collectionReference =
    Firestore.instance.collection('RecipientInfo');
    collectionReference.add(RecipientData);
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
                    child: Column(
                      children: <Widget>[
                        inputFile(
                            label: "Name:",
                            validator: (val) =>
                            val.isEmpty ? 'Enter Recipient Name' : null,
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            }),
                        inputFile(
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
                Divider(),
                SizedBox(
                  width: 300,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      addPhoneNumber();
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
                  ),),
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
