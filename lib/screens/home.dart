import 'package:alpharos/screens/main_tabs/home_widget.dart';
import 'package:alpharos/screens/main_tabs/notifications.dart';
import 'package:alpharos/screens/main_tabs/discover.dart';
import 'package:alpharos/screens/main_tabs/profile.dart';
import 'package:alpharos/services/nagivation_service.dart';
import 'package:alpharos/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _childrenOfAppBar = [
    AppBar(
      title: Icon(Icons.chat),
      centerTitle: true,
    ),
    AppBar(
      title: SizedBox(
        width: 250.0,
        child: FlatButton(
          onPressed: () {
            NavigationService.instance.navigateTo('/search');
          },
          color: Colors.grey[100],
          textColor: Colors.grey[700],
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            // side: BorderSide(color: Colors.red)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // Replace with a Row for horizontal icon + text
            children: <Widget>[Icon(Icons.search), Text("Search")],
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: Icon(Icons.settings), onPressed: () {}),
      ],
    ),
    AppBar(
      title: Text('Notifications'),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              NavigationService.instance.navigateTo('/notification_settings');
            }),
      ],
    ),
    AppBar(
      title: Text('My Profile'),
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(icon: Icon(Icons.settings), onPressed: () {}),
      ],
    ),
  ];

  final List<Widget> _childrenOfBody = [
    HomeWidget(),
    Discover(),
    Notifications(),
    Profile(displayUserUid: 'user'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _childrenOfAppBar[_selectedIndex],
      drawer: drawer(context),
      body: _childrenOfBody[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post');
        },
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: bottomNavigationBar(context),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, //for 4 or more items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
