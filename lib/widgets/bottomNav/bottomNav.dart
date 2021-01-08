import 'package:flutter/material.dart';
import 'package:mi_card/widgets/announce/announce.dart';
import 'package:mi_card/widgets/templates/templates.dart';
import 'package:mi_card/widgets/contacts/contacts.dart';
import 'package:mi_card/widgets/profile/profile.dart';

class BottomNav extends StatefulWidget {
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
      appBar: AppBar(
        title: Text('Formateacher'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue[400],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.record_voice_over), label: 'Announce'),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            label: 'Templates',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon_outlined), label: 'Profile')
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
