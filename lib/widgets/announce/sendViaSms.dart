import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

// Announce Page

// List of numbers to send to one or many numbers.
List<String> recipients = [];

class SendViaSms extends StatefulWidget {
  String message = "";

  SendViaSms({Key key, this.message}) : super(key: key);

  @override
  _SendViaSmsState createState() => _SendViaSmsState();
}

class _SendViaSmsState extends State<SendViaSms> {
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
      body: SafeArea(
          child: Container(
              child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 10),
        ),
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 5),
        ),
        Text('Select Contacts',
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
        height: 70.0,
        width: 160.0,
        child: FittedBox(
          child: FloatingActionButton.extended(
              elevation: 0.0,
              icon: Icon(Icons.send),
              label: Text('Confirm Send'),
              backgroundColor: Colors.green[700],
              onPressed: () {
                _sendSMS('${widget.message}', recipients);
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Done()),
//                );
              }),
        ),
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipients) async {
  String _result = await sendSMS(message: message, recipients: recipients)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
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
          if (selected) {
            recipients.add(widget.phone);
          } else {
            recipients.removeWhere((element) => element == widget.phone);
          }
          print(recipients);
        });
      },
      value: selected,
    );
  }
}
