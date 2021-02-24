import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String uid;
  String name;
  String phone;

  Contact(this.uid, this.name, this.phone);

  Contact.fromSnapshot(DocumentSnapshot snapshot)
      : uid = snapshot['uid'],
        name = snapshot['name'],
        phone = snapshot['phone'];
}
