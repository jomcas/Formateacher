import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/important_form.dart';
import 'package:mi_card/widgets/announce/reminder_form.dart';
import 'package:mi_card/widgets/announce/schedule_form.dart';
import 'package:mi_card/widgets/announce/todo_form.dart';

// Announce Page
class Announce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0795A8),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
//              margin: const EdgeInsets.all(4.0),
//              padding: const EdgeInsets.only(top: 75),
            height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.2 - 20,
                    decoration: BoxDecoration(
                      color: Color(0xff0795A8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Select Category',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0)),
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Choose announcement you want to make.',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: Colors.white,
                              letterSpacing: 0)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
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
                            builder: (context) => Importantform()));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.teal[200],
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/important.png"),
                                  fit: BoxFit.fitHeight)),
                        ),
                        ListTile(
                          title: Text(
                            ' Important',
                            style: TextStyle(fontSize: 20,),
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
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.teal[200],
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Schedule.png"),
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
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.teal[200],
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 75,
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
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    color: Colors.teal[200],
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(bottom: 100),
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Todo.png"),
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
