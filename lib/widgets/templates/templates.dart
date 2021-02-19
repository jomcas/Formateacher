import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/previewTemplate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';
import 'package:timeago/timeago.dart' as timeago;

// Announce Page
class Templates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListPage();
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //Get data in firestore
  Future getPosts() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("TemplateInfo")
        .where('UID', isEqualTo: uid)
        .orderBy("timestamp", descending: false)
        .getDocuments();
    print(uid);
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewTemplate(Template: post)));
  }

  String getTemplateImage(dynamic category) {
    if (category == 'Important') {
      return "important";
    } else if (category == "Schedule") {
      return "Schedule";
    } else if (category == "Reminder") {
      return "reminder";
    } else if (category == "Todo") {
      return "Todo";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 30),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 100),
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/template.png"),
                  fit: BoxFit.fitHeight)),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Templates',
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
                      labelText: 'Search Template',
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
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("images/" +
                                  getTemplateImage(
                                      snapshot.data[index].data["category"]) +
                                  ".png"),
                            ),
                            title: (Text(
                                snapshot.data[index].data["template"] ??
                                    "TEMPLATE")),
                            subtitle: Text("Saved " +
                                timeago.format(DateTime.tryParse(snapshot
                                    .data[index].data["timestamp"]
                                    .toDate()
                                    .toString()))),
                            onTap: () {
                              navigateToDetail(snapshot.data[index]);
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showAlertDialogTwoButtons(
                                    context,
                                    Icon(Icons.delete_forever,
                                        size: 50, color: Colors.black),
                                    ' Do you want to delete this template?',
                                    'CANCEL',
                                    'DELETE', () async {
                                  await Firestore.instance.runTransaction(
                                      (Transaction myTransaction) async {
                                    await myTransaction
                                        .delete(snapshot.data[index].reference);
                                  });
                                  Navigator.pop(context);
                                  setState(() {});
                                });
                              },
                            ),
                          );
                        });
                  }
                })),
      ]))),
    );
  }
}
