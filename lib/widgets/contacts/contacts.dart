import 'package:flutter/material.dart';
import 'package:mi_card/widgets/contacts/contactsModel.dart';
import 'package:mi_card/widgets/contacts/addContact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Announce Page

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  //Get recipient data in firestore
  Future getPosts() async {
    var firestores = Firestore.instance;
    QuerySnapshot qn =
        await firestores.collection("RecipientInfo").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 20),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 100),
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/phonebook.png"),
                  fit: BoxFit.fitHeight)),
        ),
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 5),
        ),
        Text('Phonebook',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Search Contact',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search, color: Colors.black)),
                ))
              ],
            )),
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return Recipient(
                            name: (Text(
                                    snapshot.data[index].data["name"] ?? "NAME")
                                .data),
                            phone: (Text(snapshot.data[index].data["phone"] ??
                                    "PHONENUMBER")
                                .data),
                          );
                        });
                  }
                })),
      ]))),
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FittedBox(
          child: FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.add_call),
              backgroundColor: Color(0xff0795A8),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddContact()),
                );
              }),
        ),
      ),
    );
  }
}

class Recipient extends StatefulWidget {
  final String name;
  final String phone;

  Recipient({this.name, this.phone});

  @override
  _RecipientState createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      secondary: Icon(Icons.contact_phone),
      title: (Text(widget.name)),
      subtitle: (Text(widget.phone)),
      onChanged: (bool value) {
        setState(() {
          selected = value;
          print(selected);
        });
      },
      value: selected,
    );
  }
}
