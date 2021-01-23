import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/preview.dart';
import 'package:mi_card/widgets/signUp.dart';

class ScheduleForm extends StatefulWidget {
  @override
  _ScheduleFormState createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  List<Widget> _fieldWidgets = List<Widget>();
  int index = 1;
  String message = '';
  String messageBox = '';
  String classCode = '';
  String classCodeMessage = '';
  String subjectType = '';
  String subjectTypeMessage = '';
  String subjectName = '';
  String subjectNameMessage = '';
  String subjectHours = '';
  String subjectHoursMessage = '';

  void addTitle() {
    _fieldWidgets.add(inputFile(
        label: "Message:",
        validator: (val) =>
        val.isEmpty ? 'Please enter message' : null,
        onChanged: (val) {
          setState(() {
            message = val;
          });
        }),);
    _fieldWidgets.add(inputFile(
        label: "Class Code:",
        validator: (val) =>
        val.isEmpty ? 'Please enter class code' : null,
        onChanged: (val) {
          setState(() {
            classCode = val;
          });
        }),);
    addSubject();
  }

  void addSubject() {
    _fieldWidgets.add(inputFile(
        label: "Subject $index Class Type:",
        validator: (val) =>
        val.isEmpty ? 'Please Class Type' : null,
        onChanged: (val) {
          setState(() {
            subjectType = val;
          });
        }),);
    _fieldWidgets.add(inputFile(
        label: "Subject $index Class Hours:",
        validator: (val) =>
        val.isEmpty ? 'Please Class Hours' : null,
        onChanged: (val) {
          setState(() {
            subjectHours = val;
          });
        }),);
    _fieldWidgets.add(inputFile(
        label: "Subject $index Class Name:",
        validator: (val) =>
        val.isEmpty ? 'Please Class Name' : null,
        onChanged: (val) {
          setState(() {
            subjectName = val;
          });
        }),);
    index++;
  }

  void removeSubject() {
    setState(() {
      try {
        if (_fieldWidgets.length <= 5) {
          index = 1;

        } else {
          _fieldWidgets.length = _fieldWidgets.length - 3;
          index--;

        }
      } catch (e) {}
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addTitle();
  }

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
            padding: const EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage('images/clock.png'),
              height: 10.0,
              width: 40.0,
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

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
          Text('Selected Category: Schedule',
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
                    child: Column(
                      children: List.generate(_fieldWidgets.length, (index) {
                        return _fieldWidgets[index];
                      }),
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

                      messageBox = '$message';
                      classCodeMessage = 'Class Code: $classCode';
                      subjectNameMessage = 'Subject: $subjectName';
                      subjectTypeMessage = 'Class Type: $subjectType';
                      subjectHoursMessage = 'Class Hours: $subjectHours';

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PreviewPage(str: messageBox, classCode: classCodeMessage, subjectType: subjectTypeMessage, subjectName: subjectNameMessage, subjectHours: subjectHoursMessage,)));
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
                  width: 900,
                  child: Row(
                    children: [
                      Container(

                        padding: EdgeInsets.only(left: 35.0),
//                height: 70.0,
//                width: 160.0,
                        child: FittedBox(
                          child: FloatingActionButton.extended(
                              heroTag: 'btn1',
                              elevation: 0.0,
                              icon: Icon(Icons.add),
                              label: Text('Add Subject'),
                              backgroundColor: Colors.green[700],
                              onPressed: () {
                                setState(() {
                                  addSubject();
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 5.0),
                        height: 70.0,
                        width: 180.0,
                        child: FittedBox(
                          child: FloatingActionButton.extended(
                              heroTag: 'btn2',
                              elevation: 0.0,
                              icon: Icon(Icons.delete),
                              label: Text('Delete Subject'),
                              backgroundColor: Colors.red[700],
                              onPressed: () {
                                removeSubject();
                              }),
                        ),
                      )
                    ],
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

class Field extends StatelessWidget {
  final String label;
  final bool obscureText = false;

  Field({this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
