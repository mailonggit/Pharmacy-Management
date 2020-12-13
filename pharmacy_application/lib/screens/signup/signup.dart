import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/signup/body.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Body(),
    );
  }
}
