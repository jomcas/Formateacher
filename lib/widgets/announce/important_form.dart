import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/preview.dart';
import 'package:mi_card/widgets/signUp.dart';


class importantform extends StatefulWidget {
  @override
  _importantformState createState() => _importantformState();
}

class _importantformState extends State<importantform> {

  final _formKey = GlobalKey<FormState>();
  String purpose = '';
  String grade = '';
  String section = '';
  String date = '';
  String start_time = '';
  String end_time = '';
  String ImportantFormat = '';



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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 0),
              ),
              Text("Create",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2.5)),
              Text(" Announcement",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2.5)),
              SizedBox(height: 20),
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
                                  label: "Purpose:",
                                  validator: (val) =>
                                  val.isEmpty ? 'Please put your purpose' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      purpose = val;
                                    });
                                  }),
                              inputFile(
                                  label: "Grade:",
                                  validator: (val) =>
                                  val.isEmpty ? 'Please put grade of student' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      grade = val;
                                    });
                                  }),
                              inputFile(
                                  label: "Section:",
                                  validator: (val) =>
                                  val.isEmpty ? 'Please put student section' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      section = val;
                                    });
                                  }),
                              inputFile(
                                  label: "Date:",
                                  validator: (val) => val.isEmpty
                                      ? 'Please enter date of event'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => date = val);
                                  }),
                              inputFile(
                                  label: "Start Time:",
                                  validator: (val) => val.length < 6
                                      ? 'Please put start time of event'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => start_time = val);
                                  }),
                              inputFile(
                                  label: "End Time:",
                                  validator: (val) => val.isEmpty
                                      ? 'Please put end time of event'
                                      : null,
                                  onChanged: (val) {
                                    setState(() {
                                      end_time = val;
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
                      width: 335,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                            ImportantFormat = 'To all grade $grade student section $section. There will be a $purpose on $date at around $start_time to $end_time.';
                            print(ImportantFormat);
                            
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewPage(str: ImportantFormat)));
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => Preview()),
//                          );
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
