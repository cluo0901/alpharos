import 'package:alpharos/models/app_user.dart';
import 'package:alpharos/screens/profile/edit_profile.dart';
import 'package:alpharos/screens/search.dart';
import 'package:alpharos/screens/notifications/notification_settings.dart';
import 'package:alpharos/screens/user_profile.dart';
import 'package:alpharos/screens/wrapper.dart';
import 'package:alpharos/services/auth_service.dart';
import 'package:alpharos/services/nagivation_service.dart';
import 'package:flutter/material.dart';
import 'package:alpharos/screens/auth/register.dart';
import 'package:alpharos/screens/auth/login.dart';
import 'package:alpharos/screens/post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
          navigatorKey: NavigationService.instance.navigationKey,
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/register': (context) => Register(),
            '/login': (context) => Login(),
            '/search': (context) => Search(),
            '/post': (context) => Post(),
            '/notification_settings': (context) => NotificationSettings(),
            '/edit_profile': (context) => EditProfile(),
            '/user_profile': (context) => UserProfile(),
          }),
    );
  }
}
