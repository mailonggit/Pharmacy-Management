import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/welcome/body.dart';





class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.blue[50],
      body: Body(), 
    );
  }
}