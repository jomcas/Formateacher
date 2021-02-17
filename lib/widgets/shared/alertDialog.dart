import 'package:flutter/material.dart';

showAlertDialogOneButton(
    BuildContext context, Icon title, String message, String buttonText) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(buttonText),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title,
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogTwoButtons(BuildContext context, Icon title, String content,
    String buttonOneText, String buttonTwoText, dynamic confirmOnPressed) {
  Widget cancelButton = FlatButton(
    child: Text(buttonOneText, style: TextStyle(color: Colors.grey)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
      child: Text(
        buttonTwoText,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
      ),
      onPressed: confirmOnPressed);

  AlertDialog alert = AlertDialog(
    title: title,
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
