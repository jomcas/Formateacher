import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/preview.dart';
import 'package:mi_card/widgets/signUp.dart';

class Importantform extends StatefulWidget {
  @override
  _ImportantformState createState() => _ImportantformState();
}

class _ImportantformState extends State<Importantform> {
  final _formKey = GlobalKey<FormState>();
  String purpose = '';
  String grade = '';
  String section = '';
  String date = '';
  String startTime = '';
  String endTime = '';
  String importantFormat = '';

  int year = 0;
  int days = 0;
  int month = 0;

  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        year = _date.year;
        month = _date.month;
        days = _date.day;
        date = "$year-$month-$days";
        print(date);
      });
    }
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
              image: AssetImage('images/Important.png'),
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
//          SizedBox(height: 15),
          Text('Selected Category: Important',
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
                              labelhint: "E.g Parent Orientation",
                              label: "Purpose:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put your purpose'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  purpose = val;
                                });
                              }),
                          inputFile(
                              labelhint: "E.g 9",
                              label: "Grade:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put grade of student'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  grade = val;
                                });
                              }),
                          inputFile(
                              labelhint: "E.g Courage",
                              label: "Section:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put student section'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  section = val;
                                });
                              }),
                          inputFile(
                              label: "Date:",
                              readOnly: true,
//                            validator: (val) => val.isEmpty
//                                ? 'Please enter the upcoming date'
//                                : null,
                              labelhint: date == '' ? "Select Date..." : date,
                              onTap: () {
                                setState(() {
                                  selectDate(context);
                                });
                              }),
                          inputFile(
                              labelhint: "E.g 10am",
                              label: "Start Time:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put start time of event'
                                  : null,
                              onChanged: (val) {
                                setState(() => startTime = val);
                              }),
                          inputFile(
                              labelhint: "E.g 11am",
                              label: "End Time:",
                              validator: (val) => val.isEmpty
                                  ? 'Please put end time of event'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  endTime = val;
                                });
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
                  width: 290,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        importantFormat =
                            'To all grade $grade student section $section. There will be a $purpose on $date at around $startTime to $endTime.';
                        print(importantFormat);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreviewPage(
                                      str: importantFormat,
                                      category: "Important",
                                    )));
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

//class ImportantForm extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 0,
//        brightness: Brightness.light,
//        backgroundColor: Colors.white,
//        leading: IconButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          icon: Icon(
//            Icons.arrow_back_rounded,
//            size: 30,
//            color: Colors.black,
//          ),
//        ),
//      ),
//      backgroundColor: Colors.white,
//      body: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Container(
//                margin: const EdgeInsets.all(4.0),
//                padding: const EdgeInsets.only(top: 0),
//              ),
//              Text("Create",
//                  style: TextStyle(
//                      fontSize: 35,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.black,
//                      letterSpacing: 2.5)),
//              Text(" Announcement",
//                  style: TextStyle(
//                      fontSize: 35,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.black,
//                      letterSpacing: 2.5)),
//              SizedBox(height: 20),
//              Text('Selected Category: Important',
//                  style: TextStyle(
//                      fontFamily: 'Inter',
//                      fontSize: 13,
//                      color: Colors.black,
//                      letterSpacing: 0)),
//              Container(
//                margin: const EdgeInsets.all(4.0),
//                padding: const EdgeInsets.only(top: 10),
//              ),
//              Container(
//                child: Column(
//                  children: <Widget>[
//                    SizedBox(
//                      width: 400,
//                      child: Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 40),
//                        child: Column(
//                          children: <Widget>[
//                            inputFile(label: "Purpose:"),
//                            inputFile(label: "Grade:"),
//                            inputFile(label: "Section:"),
//                            inputFile(label: "Date:"),
//                            inputFile(label: "Start Time:"),
//                            inputFile(label: "End Time:"),
//                          ],
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    SizedBox(
//                      width: 335,
//                      child: MaterialButton(
//                        minWidth: double.infinity,
//                        height: 60,
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => Preview()),
//                          );
//                        },
//                        color: Color(0xff0795A8),
//                        elevation: 0,
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(25),
//                        ),
//                        child: Text(
//                          "Format It!",
//                          style: TextStyle(
//                            fontWeight: FontWeight.w600,
//                            fontSize: 18,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 0,
//                    ),
//                  ],
//                ),
//              )
//            ],
//          )),
//    );
//  }
//}

//class ImportantFormPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 0,
//        brightness: Brightness.light,
//        backgroundColor: Colors.white,
//        leading: IconButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          icon: Icon(
//            Icons.arrow_back_rounded,
//            size: 30,
//            color: Colors.black,
//          ),
//        ),
//      ),
//      backgroundColor: Colors.white,
//      body: SingleChildScrollView(
//          child: Column(
//        children: <Widget>[
//          Container(
//            margin: const EdgeInsets.all(4.0),
//            padding: const EdgeInsets.only(top: 0),
//          ),
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
//          Text('Selected Category: Important',
//              style: TextStyle(
//                  fontFamily: 'Inter',
//                  fontSize: 13,
//                  color: Colors.black,
//                  letterSpacing: 0)),
//          Container(
//            margin: const EdgeInsets.all(4.0),
//            padding: const EdgeInsets.only(top: 10),
//          ),
//          Container(
//            child: Column(
//              children: <Widget>[
//                SizedBox(
//                  width: 400,
//                  child: Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 40),
//                    child: Column(
//                      children: <Widget>[
//                        inputFile(label: "Purpose:"),
//                        inputFile(label: "Grade:"),
//                        inputFile(label: "Section:"),
//                        inputFile(label: "Date:"),
//                        inputFile(label: "Start Time:"),
//                        inputFile(label: "End Time:"),
//                      ],
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 10,
//                ),
//                SizedBox(
//                  width: 335,
//                  child: MaterialButton(
//                    minWidth: double.infinity,
//                    height: 60,
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Preview()),
//                      );
//                    },
//                    color: Color(0xff0795A8),
//                    elevation: 0,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(25),
//                    ),
//                    child: Text(
//                      "Format It!",
//                      style: TextStyle(
//                        fontWeight: FontWeight.w600,
//                        fontSize: 18,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 0,
//                ),
//              ],
//            ),
//          )
//        ],
//      )),
//    );
//  }
//}

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
