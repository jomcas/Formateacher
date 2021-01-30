import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/preview.dart';
import 'package:mi_card/widgets/signUp.dart';

class ReminderForm extends StatefulWidget {
  @override
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final _formKey = GlobalKey<FormState>();
  String purpose = '';
  String day = '';
  String date = '';
  String time = '';
  String platform = '';
  String reminderFormat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
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
        title: Text('Create Announcement',
            style: TextStyle(
                fontSize: 20,
//            fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage('images/reminder.png'),
              height: 10.0,
              width: 40.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 0),
          ),
//          Text("Create",
//              style: TextStyle(
//                  fontSize: 35,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.black,
//                  letterSpacing: 2.5)),
//          Text(" Announcement",
//              style: TextStyle(
//                  fontSize: 35,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.black,
//                  letterSpacing: 2.5)),
//          SizedBox(height: 20),
          Text('Selected Category: Reminder',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: Colors.black,
                  letterSpacing: 0)),
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 10),
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          inputFile(
                              label: "Discussion:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put your purpose'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  purpose = val;
                                });
                              }),
                          inputFile(
                              label: "Day:",
                              validator: (val) => val.isEmpty
                                  ? 'Please enter the upcoming day'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  day = val;
                                });
                              }),
                          inputFile(
                              label: "Date:",
                              validator: (val) => val.isEmpty
                                  ? 'Please enter the upcoming date'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  date = val;
                                });
                              }),
                          inputFile(
                              label: "Time:",
                              validator: (val) => val.isEmpty
                                  ? 'Please enter time for upcoming event'
                                  : null,
                              onChanged: (val) {
                                setState(() => time = val);
                              }),
                          inputFile(
                              label: "Platform:",
                              validator: (val) => val.length < 6
                                  ? 'Please enter plaform that will be used.'
                                  : null,
                              onChanged: (val) {
                                setState(() => platform = val);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 335,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        reminderFormat =
                            "Good Day Students I just wanted to remind you about the meeting we have scheduled for $day $date at $time. That will be held using $platform, and we'll be discussing $purpose.";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PreviewPage(str: reminderFormat)));
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => PreviewPage()),
//                          );
                      }
                    },
                    color: Color(0xff0795A8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Format It!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

////Text Widget
//Widget inputFile({label, obscureText = false}) {
//  return Column(
//    crossAxisAlignment: CrossAxisAlignment.start,
//    children: <Widget>[
//      Text(
//        label,
//        style: TextStyle(
//            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
//      ),
//      SizedBox(
//        height: 5,
//      ),
//      TextField(
//        obscureText: obscureText,
//        decoration: InputDecoration(
//          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//          enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.grey[400]),
//          ),
//          border: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.grey[400]),
//          ),
//        ),
//      ),
//      SizedBox(
//        height: 10,
//      ),
//    ],
//  );
//}
