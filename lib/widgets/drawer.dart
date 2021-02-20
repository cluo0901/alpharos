import 'package:alpharos/screens/auth/welcome.dart';
import 'package:alpharos/services/auth_service.dart';
import 'package:flutter/material.dart';

final AuthService _auth = AuthService();

Widget drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          height: 600.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(height: 10.0),
                    Text('Username'),
                    SizedBox(height: 5.0),
                    Text('uid'),
                    SizedBox(height: 10.0),
                    Text('6 Following  2 Followers'),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.topic),
                title: Text('Topics'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              ListTile(
                title: Text('Settings and privacy'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Help Centre'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.lightbulb), onPressed: () {}),
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Welcome()));
                    },
                    icon: Icon(Icons.logout),
                    label: Text('Log Out')),
                IconButton(icon: Icon(Icons.qr_code), onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
