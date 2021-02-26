import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/contacts/addContact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_card/widgets/contacts/contactsModel.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';
import 'package:mi_card/widgets/shared/loading.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
      for (var contactSnapshot in _allResults) {
        var name = Contact.fromSnapshot(contactSnapshot).name.toLowerCase();

        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(contactSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    setState(() {
      _resultsList = showResults;
    });
  }

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
    setState(() {
      _allResults = qn.documents;
    });
    searchResultsList();
    return "Complete";
  }

  // Future getPostsDelete() async {
  //   final FirebaseUser user = await auth.currentUser();
  //   final uid = user.uid;

  //   var firestores = Firestore.instance;
  //   QuerySnapshot qn = await firestores
  //       .collection("RecipientInfo")
  //       .where('UID', isEqualTo: uid)
  //       .orderBy("phone", descending: false)
  //       .getDocuments();

  //   searchResultsList();
  //   return "Complete";
  // }

//Deleting a contact in firestore
  deleteContact(String uid, String name, String phone) async {
    Firestore.instance
        .collection("RecipientInfo")
        .where("UID", isEqualTo: uid)
        .where("name", isEqualTo: name)
        .where("phone", isEqualTo: phone)
        .getDocuments()
        .then((value) {
      value.documents.forEach((element) {
        Firestore.instance
            .collection("RecipientInfo")
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image(image: AssetImage("images/phone.png"), height: 35,),
        ),
        backgroundColor: Color(0xff0795A8),
        elevation: 0,
        title: Text("Phonebook", style: TextStyle(color: Colors.white),),
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
//                  image: AssetImage("images/phonebook.png"),
//                  fit: BoxFit.fitHeight)),
//        ),
//        Container(
//          margin: const EdgeInsets.all(4.0),
//          padding: const EdgeInsets.only(top: 5),
//        ),
//        Text('Phonebook',
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
                      labelText: 'Search Contact',
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
                    itemBuilder: (BuildContext context, int index) {
                      return Recipient(
                          name: (Text(_resultsList[index]["name"] ?? "NAME")
                              .data),
                          phone: (Text(
                                  _resultsList[index]["phone"] ?? "PHONENUMBER")
                              .data),
                          delete: () async {
                            deleteContact(
                                _resultsList[index]["UID"],
                                _resultsList[index]["name"],
                                _resultsList[index]["phone"]);

                            Navigator.pop(context);

                            setState(() {});
                          });
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
