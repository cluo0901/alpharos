import 'package:alpharos/screens/main_tabs/profile.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String displayUserUid;

  UserProfile({this.displayUserUid});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Profile(displayUserUid: widget.displayUserUid),
    );
  }
}
