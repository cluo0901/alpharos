import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
