import 'package:cloud_firestore/cloud_firestore.dart';

class Template {
  String uid;
  String category;
  String template;
  DateTime timestamp;

  Template(this.uid, this.category, this.template, this.timestamp);

  Template.fromSnapshot(DocumentSnapshot snapshot)
      : uid = snapshot['uid'],
        category = snapshot['category'],
        template = snapshot['template'],
        timestamp = snapshot['timestamp'].toDate();
}
