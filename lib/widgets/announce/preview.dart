import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:mi_card/widgets/animation/slideRight.dart';
import 'package:mi_card/widgets/announce/sendViaSms.dart';
import 'package:mi_card/widgets/signUp.dart';
import 'package:flutter_share/flutter_share.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage();
  }
}

class PreviewPage extends StatefulWidget {
  String str = "";
  String classCode = "";
  String subjectType = "";
  String subjectName = "";
  String subjectHours = "";

  PreviewPage(
      {Key key,
      this.str,
      this.classCode,
      this.subjectType,
      this.subjectName,
      this.subjectHours})
      : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

// List of numbers to send to one or many numbers.
List<String> recipeients = ["09278880720","09554361983","09759930453"];

class _PreviewPageState extends State<PreviewPage> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Send your message',
        text: '${widget.str}',
        chooserTitle: 'Send');
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 0),
          ),
          Column(
            children: <Widget>[
              Text(
                'Message Preview',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                  padding: EdgeInsets.all(16.0),
                    child: Scrollbar(
                      child: TextFormField(
                        style: TextStyle(fontSize: 20.0, fontFamily: 'Raleway'),
                        initialValue:
                            '${widget.str}',
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
                    onPressed: share,
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
                      _sendSMS('${widget.str}', recipeients);
//                      Navigator.push(
//                        context,
//                        SlideRightRoute(page: SendViaSms()),
//                      ),
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

void _sendSMS(String message, List<String> recipients) async {
  String _result = await sendSMS(message: message, recipients: recipients).catchError((onError){
    print(onError);
  });
  print(_result);
}
