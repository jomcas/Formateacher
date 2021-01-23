import 'package:flutter/material.dart';
import 'package:mi_card/widgets/animation/slideRight.dart';
import 'package:mi_card/widgets/announce/sendViaSms.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';
import 'package:mi_card/widgets/signUp.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage();
  }
}

class PreviewPage extends StatelessWidget {
  String str = "";
  String classCode = "";
  String subjectType = "";
  String subjectName = "";
  String subjectHours = "";

  PreviewPage({Key key, this.str, this.classCode, this.subjectType, this.subjectName, this.subjectHours}) : super(key: key);

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
            padding: const EdgeInsets.only(top: 20),
          ),
          Column(
            children: <Widget>[
              Text(
                "Preview",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                    child: Scrollbar(
                      child: TextFormField(
                        initialValue: '$str \n\n $classCode \n\n $subjectName \n\n $subjectType \n\n $subjectHours',
                        readOnly: true,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    height: 400,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    )),
                SizedBox(
                    width: 360,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideRightRoute(page: SignUp()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Save to Templates..',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                        ))),
                SizedBox(
                  width: 335,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlideRightRoute(page: BottomNav()),
                      );
                    },
                    color: Colors.blue[400],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Send via Messenger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 335,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlideRightRoute(page: SendViaSms()),
                      );
                    },
                    color: Color(0xff0795A8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Send via SMS",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
