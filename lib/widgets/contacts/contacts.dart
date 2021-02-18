import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/contacts/addContact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';

// Announce Page

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //Get recipient data in firestore
  Future getPosts() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    var firestores = Firestore.instance;
    QuerySnapshot qn = await firestores
        .collection("RecipientInfo")
        .where('UID', isEqualTo: uid)
        .orderBy("phone", descending: false)
        .getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
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
                        itemCount:
                            (snapshot.data == null) ? 0 : snapshot.data.length,
                        itemBuilder: (_, index) {
                          return Recipient(
                              name: (Text(snapshot.data[index].data["name"] ??
                                      "NAME")
                                  .data),
                              phone: (Text(snapshot.data[index].data["phone"] ??
                                      "PHONENUMBER")
                                  .data),
                              delete: () async {
                                // Deleting a file
                                await Firestore.instance.runTransaction(
                                    (Transaction myTransaction) async {
                                  await myTransaction
                                      .delete(snapshot.data[index].reference);
                                });
                                Navigator.pop(context);

                                setState(() {});
                              });
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
  final dynamic delete;

  Recipient({this.name, this.phone, this.delete});

  @override
  _RecipientState createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.contact_phone),
      title: (Text(widget.name)),
      subtitle: (Text(widget.phone)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // nagdedelete
          showAlertDialogTwoButtons(
              context,
              Icon(Icons.delete_forever, size: 50, color: Colors.black),
              ' Do you want to delete this contact?',
              'CANCEL',
              'DELETE',
              widget.delete);
        },
      ),
    );
  }
}
