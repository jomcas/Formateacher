import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/preview.dart';
import 'package:mi_card/widgets/signUp.dart';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  String grade = '';
  String section = '';
  String activity = '';
  String time = '';
  String todoFormat = '';

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
        title: Text('Create Announcement',style: TextStyle(
            fontSize: 25,
//            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image(
                image: AssetImage('images/todolist.png'),
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
          Text('Selected Category: ToDo',
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
                              label: "Grade:",
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter grade' : null,
                              onChanged: (val) {
                                setState(() {
                                  grade = val;
                                });
                              }),
                          inputFile(
                              label: "Section:",
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter section' : null,
                              onChanged: (val) {
                                setState(() {
                                  section = val;
                                });
                              }),
                          inputFile(
                              label: "Activity:",
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter activity' : null,
                              onChanged: (val) {
                                setState(() {
                                  activity = val;
                                });
                              }),
                          inputFile(
                              label: "Deadline:",
                              validator: (val) => val.isEmpty
                                  ? 'Please enter time for upcoming event'
                                  : null,
                              onChanged: (val) {
                                setState(() => time = val);
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
                      todoFormat =
                          "Hi grade $grade $section for your activity for today your task is to $activity and submit it before $time";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PreviewPage(str: todoFormat)));
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
