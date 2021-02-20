import 'package:alpharos/services/auth_service.dart';
// import 'package:alpharos/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Welcome extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.chat,
          color: Colors.blue,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
        child: Column(
          children: [
            SizedBox(
              height: 150.0,
            ),
            Text(
              'See what other smart investors are trading.',
              style: TextStyle(
                fontSize: 40,
                // fontWeight: bold,
              ),
            ),
            SizedBox(height: 15.0),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                // side: BorderSide(color: Colors.red)
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Create account',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  // fontWeight: bold,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            // Expanded(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Row(
            //       children: [
            //         Text('Have an account already?'),
            //         TextButton(
            //           onPressed: () {
            //             Navigator.pushNamed(context, '/login');
            //           },
            //           child: Text('Log in'),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Have an account already?')),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Log in'),
                  )
                ],
              ),
            ),

            //google sign in
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          indent: 25.0,
                          color: Colors.grey[700],
                        )),
                        SizedBox(width: 15.0),
                        Text(
                          'Sign in with',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                            child: Divider(
                          endIndent: 25.0,
                          color: Colors.grey[700],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    IconButton(
                      onPressed: () async {
                        dynamic result = await _auth.signInWithGoogle();
                        if (result == null) {
                          print('google sign in failed');
                          // setState(() {
                          //   error = 'Please enter correct username and password.';
                          // });
                        }
                      },
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
