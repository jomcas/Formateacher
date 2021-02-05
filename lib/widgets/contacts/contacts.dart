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
    QuerySnapshot qn = await firestores.collection("RecipientInfo").getDocuments();
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
                                leading: Icon(Icons.contact_phone),
                                title: (Text(snapshot.data[index].data["name"] ?? "NAME")),
                                subtitle: (Text(snapshot.data[index].data["phone"] ?? "PHONENUMBER")),
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

//class _ContactListItem extends ListTile {
//  _ContactListItem(Contact contact)
//      : super(
//            onTap: () {},
//            title: new Text(contact.fullName),
//            subtitle: new Text(contact.contactNumber),
//            leading: new CircleAvatar(child: new Text(contact.fullName[0])));
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
