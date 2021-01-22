import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/important_form.dart';
import 'package:mi_card/widgets/announce/reminder.dart';
import 'package:mi_card/widgets/announce/schedule_form.dart';
import 'package:mi_card/widgets/announce/todo_form.dart';

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
            SizedBox(height: 15),
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                // Important
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => importantform()));
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
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/important.png"),
                                  fit: BoxFit.fitHeight)),
                        ),
                        ListTile(
                          title: Text(
                            ' Important',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Schedule
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleForm()));
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
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/clock.png"),
                                  fit: BoxFit.fitHeight)),
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
                // Reminder
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReminderForm()));
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
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/reminder.png"),
                                  fit: BoxFit.fitHeight)),
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
                // Todo
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoForm()));
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
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/todolist.png"),
                                  fit: BoxFit.fitHeight)),
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
