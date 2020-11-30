import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/screens/login/login.dart';
import 'package:pharmacy_application/screens/signup/signup.dart';
import 'package:pharmacy_application/screens/welcome/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
            // Text(
            //   'Welcome To Pharmacy System',
            //   style: TextStyle(
            //     color: Colors.blue[900],
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //     fontStyle: FontStyle.italic,
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.03,
            // ),
            Image.asset('assets/images/logo.png', width: size.width * 0.5,),
            RoundedButton(
              text: 'Login',
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
              color: Colors.blue[800],
            ),
            RoundedButton(
              text: 'Sign Up',
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
              color: Colors.green[900],
            ),
          ],
        ),
      ),
    );
  }
}
