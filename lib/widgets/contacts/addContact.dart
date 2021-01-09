import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddContactPage();
  }
}

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue[400],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 200),
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
                        icon: Icon(Icons.person, size: 50, color: Colors.black),
                        hintText: 'Name'),
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
                        icon: Icon(Icons.phone, size: 50, color: Colors.black),
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
                    height: 40,
                    child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue[400],
                        child: Text('Add',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)))),
                SizedBox(
                    width: 360,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Select From Contacts',
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
