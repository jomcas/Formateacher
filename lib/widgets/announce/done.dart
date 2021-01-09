import 'package:flutter/material.dart';
import 'package:mi_card/widgets/animation/slideRight.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';

class Done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DonePage();
  }
}

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
                "Announcement Sent",
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
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/add.png"),
                          fit: BoxFit.fitHeight)),
                ),
                SizedBox(height: 50),
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
                    color: Color(0xff0795A8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Back To Home",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
