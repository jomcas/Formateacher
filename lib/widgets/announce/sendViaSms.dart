import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:mi_card/widgets/announce/done.dart';
import 'package:mi_card/widgets/contacts/contactsModel.dart';

// Announce Page

class SendViaSms extends StatefulWidget {
  String message = "";

  SendViaSms(
      {Key key,
        this.message})
      : super(key: key);

  @override
  _SendViaSmsState createState() => _SendViaSmsState();
}

class _SendViaSmsState extends State<SendViaSms> {

  // List of numbers to send to one or many numbers.
  List<String> recipeients = ["09278880720","09554361983","09759930453"];

  //Get recipient data in firestore
  Future getPosts() async {
    var firestores = Firestore.instance;
    QuerySnapshot qn = await firestores.collection("RecipientInfo").getDocuments();
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
                Expanded(child: FutureBuilder(
                    future: getPosts(),
                    builder: (_, snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: Text("Loading..."),
                        );
                      }else{
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index){

                              return ListTile(
                                leading: Icon(Icons.check_box),
                                title: (Text(snapshot.data[index].data["name"] ?? "NAME")),
                                subtitle: (Text(snapshot.data[index].data["phone"] ?? "PHONENUMBER")),
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
                _sendSMS('${widget.message}', recipeients);
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

//class _ContactListItem extends ListTile {
//  _ContactListItem(Contact contact)
//      : super(
//            onTap: () {},
//            title: new Text(contact.fullName),
//            subtitle: new Text(contact.contactNumber),
//            leading: new Checkbox(value: false, onChanged: (bool value) {}));
//}
//
//class ContactPage extends StatelessWidget {
//  final List<Contact> _contacts;
//
//  ContactPage(this._contacts);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scrollbar(
//        child: ListView.builder(
//      padding: new EdgeInsets.symmetric(vertical: 8.0),
//      itemBuilder: (context, index) {
//        return new _ContactListItem(_contacts[index]);
//      },
//      itemCount: _contacts.length,
//    ));
//  }
//}


void _sendSMS(String message, List<String> recipients) async {
  String _result = await sendSMS(message: message, recipients: recipients).catchError((onError){
    print(onError);
  });
  print(_result);
}
