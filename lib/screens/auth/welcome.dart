import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
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
              height: 200.0,
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text('Have an account already?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Log in'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
