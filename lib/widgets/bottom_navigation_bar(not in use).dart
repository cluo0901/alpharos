import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed, //for 4 or more items
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Messages',
      ),
    ],
    currentIndex: 0,
    selectedItemColor: Colors.amber[800],
    // onTap: _onItemTapped,
  );
}
