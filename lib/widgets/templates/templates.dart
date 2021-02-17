import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/previewTemplate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';

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
  //Get data in firestore
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection("TemplateInfo").getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewTemplate(template: post)));
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.teal,
                              child: Text((index + 1).toString()),
                            ),
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
                                });
                              },
                            ),
                            title: (Text(
                                snapshot.data[index].data["Template"] ??
                                    "TEMPLATE")),
                            onTap: () {
                              navigateToDetail(snapshot.data[index]);
                            },
                          );
                        });
                  }
                })),
      ]))),
    );
  }
}

//class _TemplateListItem extends ListTile {
//  _TemplateListItem(Template template)
//      : super(
//            onTap: () {},
//            title: new Text(template.title),
//            subtitle: new Text(template.categoryAndDateTime),
//            leading:
//                new Checkbox(value: _isChecked, onChanged: (bool value) {}));
//}
//
//class TemplatePage extends StatelessWidget {
//  final List<Template> _templates;
//
//  TemplatePage(this._templates);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scrollbar(
//        child: ListView.builder(
//      scrollDirection: Axis.vertical,
//      shrinkWrap: true,
//      padding: new EdgeInsets.symmetric(vertical: 8.0),
//      itemBuilder: (context, index) {
//        return new _TemplateListItem(_templates[index]);
//      },
//      itemCount: _templates.length,
//    ));
//  }
//}
