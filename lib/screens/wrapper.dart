import 'package:alpharos/models/app_user.dart';
import 'package:alpharos/screens/auth/welcome.dart';
import 'package:alpharos/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    // print('user');
    //return home or welcome widget
    if (user == null) {
      return Welcome();
    } else {
      return Home();
    }
  }
}
