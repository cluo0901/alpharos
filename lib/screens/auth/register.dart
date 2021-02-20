import 'package:alpharos/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:alpharos/screens/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  // text field state
  String email = '';
  String password = '';
  String repassword = '';
  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.chat),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: 190.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Text('Crear an account'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email or username',
                  // hintText: 'Enter valid mail id as abc@gmail.com'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (val) => val.length < 6
                    ? 'Enter a password with at least 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  // hintText: 'Enter your secure password'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (val) => val.length < 6
                    ? 'Enter a password with at least 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() {
                    repassword = val;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repeat password',
                  // hintText: 'Enter your secure password'
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate() &&
                      password == repassword) {
                    // print(email);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please enter correct email and password.';
                      });
                    } else {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    }
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Text(error),
          ],
        ),
      ),
    );
  }
}
