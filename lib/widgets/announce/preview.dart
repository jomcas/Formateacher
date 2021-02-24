import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/sendViaSms.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mi_card/widgets/shared/alertDialog.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage();
  }
}

class PreviewPage extends StatefulWidget {
  String str = "hg";
  String category = "";
  String classCode = "";
  String subjectType = "";
  String subjectName = "";
  String subjectHours = "";

  PreviewPage(
      {Key key,
      this.category,
      this.str,
      this.classCode,
      this.subjectType,
      this.subjectName,
      this.subjectHours})
      : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _isButtonDisabled;
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Send your message',
        text: '${widget.str}',
        chooserTitle: 'Send');
  }

  //Save templates to database
  Map data;

  addTemplate() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    Map<String, dynamic> templateData = {
      "UID": uid,
      "category": '${widget.category}',
      "template": '${widget.str}',
      "timestamp": DateTime.now(),
    };
    CollectionReference collectionReference =
        Firestore.instance.collection('TemplateInfo');
    collectionReference.add(templateData);
  }

  void saveToTemplates() {
    showAlertDialogTwoButtons(context, Icon(Icons.speaker_notes),
        "Do you want to save this template?", "CANCEL", "CONFIRM", () {
      addTemplate();
      _isButtonDisabled = true;
      setState(() {});
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;
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
                        initialValue: '${widget.str}',
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
                // _buildCounterButton(),
                SizedBox(
                    width: 360,
                    child: FlatButton(
                        onPressed:
                            _isButtonDisabled ? null : () => saveToTemplates(),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              _isButtonDisabled
                                  ? 'Already Saved..'
                                  : "Save to Templates..",
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
                          MaterialPageRoute(
                              builder: (context) =>
                                  SendViaSms(message: widget.str)));
//                      _sendSMS('${widget.str}', recipeients);
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
                      "Send via",
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
