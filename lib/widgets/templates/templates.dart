import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/previewTemplate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';
import 'package:mi_card/widgets/shared/loading.dart';
import 'package:mi_card/widgets/templates/templatesModel.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  TextEditingController _searchController = TextEditingController();
  List _allResults = [];
  List _resultsList = [];
  Future resultsLoaded;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getPosts().then((value) {
      loading = false;
    });
  }

  _onSearchChanged() {
    searchResultsList();
    print(_searchController.text);
  }

  searchResultsList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var templateSnapshot in _allResults) {
        var template =
            Template.fromSnapshot(templateSnapshot).template.toLowerCase();

        if (template.contains(_searchController.text.toLowerCase())) {
          showResults.add(templateSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    setState(() {
      _resultsList = showResults;
    });
  }

  //Get data in firestore
  Future getPosts() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("TemplateInfo")
        .where('UID', isEqualTo: uid)
        .orderBy("timestamp", descending: true)
        .getDocuments();
    setState(() {
      _allResults = qn.documents;
    });
    searchResultsList();
    return qn.documents;
  }

//Deleting a contact in firestore
  deleteContact(String uid, String category, String template) async {
    Firestore.instance
        .collection("TemplateInfo")
        .where("UID", isEqualTo: uid)
        .where("category", isEqualTo: category)
        .where("template", isEqualTo: template)
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        Firestore.instance
            .collection("TemplateInfo")
            .document(element.documentID)
            .delete()
            .then((value) {
          print("Success!");
        });
        setState(() {
          getPosts();
        });
      });
    });
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewTemplate(template: post)));
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image(image: AssetImage("images/template.png"), height: 35,),
        ),
        backgroundColor: Color(0xff0795A8),
        elevation: 0,
        title: Text("Templates", style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
          child: Container(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.only(top: 0),
                ),
//        Container(
//          padding: EdgeInsets.only(bottom: 100),
//          height: 150,
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage("images/template.png"),
//                  fit: BoxFit.fitHeight)),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        Text('Templates',
//            style: TextStyle(
//                fontSize: 35,
//                fontWeight: FontWeight.bold,
//                color: Colors.black)),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      labelText: 'Search Template',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search, color: Colors.black)),
                ))
              ],
            )),
        Expanded(
            child: loading
                ? Loading()
                : ListView.builder(
                    itemCount: (_resultsList == null) ? 0 : _resultsList.length,
                    itemBuilder: (_, index) {
                      return (_resultsList.isEmpty)
                          ? Center(child: Text("No templates found. "))
                          : ListTile(
                              leading: Image(height: 40, image: AssetImage("images/" +
                                    getTemplateImage(
                                        _resultsList[index]["category"]) +
                                    ".png"),),
//                              CircleAvatar(
//                                radius: 25,
//                                backgroundColor: Colors.white,
//                                backgroundImage: AssetImage("images/" +
//                                    getTemplateImage(
//                                        _resultsList[index]["category"]) +
//                                    ".png"),
//                              ),
                              title: (Text(_resultsList[index]["template"] ??
                                  "TEMPLATE")),
                              subtitle: Text("Saved " +
                                  timeago.format(DateTime.tryParse(
                                      _resultsList[index]["timestamp"]
                                          .toDate()
                                          .toString()))),
                              onTap: () {
                                navigateToDetail(_resultsList[index]);
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
                                    deleteContact(
                                        _resultsList[index]["UID"],
                                        _resultsList[index]["category"],
                                        _resultsList[index]["template"]);

                                    Navigator.pop(context);
                                    setState(() {});
                                  });
                                },
                              ));
                    })),
      ]))),
    );
  }
}
