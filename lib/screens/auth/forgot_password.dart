import 'package:flutter/material.dart';
import 'package:alpharos/screens/home.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final List<Step> steps = [
    Step(
      title: const Text('Find your account'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email or username'),
          ),
          // TextFormField(
          //   decoration: InputDecoration(labelText: 'Password'),
          // ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Verify'),
      content: Column(
        children: <Widget>[
          Text('A verification code has been sent to your email address.'),
          TextFormField(
            decoration: InputDecoration(labelText: 'Verificatin code'),
          ),
          // TextFormField(
          //   decoration: InputDecoration(labelText: 'Postcode'),
          // ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Reset password'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'New password'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Repeat new password'),
          ),
        ],
      ),
    ),
    // Step(
    //   state: StepState.error,
    //   title: const Text('Avatar'),
    //   subtitle: const Text("Error!"),
    //   content: Column(
    //     children: <Widget>[
    //       CircleAvatar(
    //         backgroundColor: Colors.red,
    //       )
    //     ],
    //   ),
    // ),
  ];

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.chat),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: Text("Password reset successful!"),
                      titleTextStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                      elevation: 0.0,
                      // content: new Text(
                      //   "Tada!",
                      // ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Login now"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Home()));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                    steps: steps,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                  ),
                ),
        ],
      ),
    );
  }
}
