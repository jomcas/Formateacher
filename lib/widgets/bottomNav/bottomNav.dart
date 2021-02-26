import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/announce.dart';
import 'package:mi_card/widgets/templates/templates.dart';
import 'package:mi_card/widgets/contacts/contacts.dart';
import 'package:mi_card/widgets/profile/profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BottomNav extends StatefulWidget {
  final int index;

  BottomNav({this.index});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Announce(),
    Templates(),
    Contacts(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: onTabTapped,
        selectedIndex: _currentIndex,
        backgroundColor: Colors.white,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
//        selectedItemColor: Color(0xff0795A8),
//        unselectedItemColor: Colors.black,
//        type: BottomNavigationBarType.fixed,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: new Icon(Icons.record_voice_over), title: Text('Announce'),
            activeColor: Color(0xff0795A8),
            textAlign: TextAlign.center,),
          BottomNavyBarItem(
            icon: new Icon(Icons.speaker_notes),
            title: Text('Templates'),
            activeColor: Color(0xff0795A8),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: new Icon(Icons.contacts),
            title: Text('Contacts'),
            activeColor: Color(0xff0795A8),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.insert_emoticon_outlined), title: Text('Profile'),
              activeColor: Color(0xff0795A8),
              textAlign: TextAlign.center,)
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
