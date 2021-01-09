import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/important_form.dart';

// Announce Page
class Announce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 75),
            ),
            Text('Select Category',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0)),
            SizedBox(height: 20),
            Text('Select category of what announcement you want to make',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Colors.black,
                    letterSpacing: 0)),
            SizedBox(height: 50),
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportantForm()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.yellow,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Icon(
                          Icons.error,
                          size: 80,
                        ),
                        ListTile(
                          title: Text(
                            'Important',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportantForm()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.orange,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Icon(
                          Icons.schedule,
                          size: 80,
                        ),
                        ListTile(
                          title: Text(
                            'Schedule',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportantForm()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.red,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Icon(
                          Icons.notifications,
                          size: 80,
                        ),
                        ListTile(
                          title: Text(
                            'Reminder',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImportantForm()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.yellow,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Icon(
                          Icons.fact_check,
                          size: 80,
                        ),
                        ListTile(
                          title: Text(
                            'Todo',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
