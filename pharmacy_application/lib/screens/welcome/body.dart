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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/doctor_other.png', width: size.width * 0.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                text: 'Login',
                press: () {
                  Navigator.of(context).pushReplacementNamed(Login.routeName);
                },
                color: Colors.blue[800],
              ),
            ),
            RoundedButton(
              text: 'Sign Up',
              press: () {
                Navigator.of(context).pushReplacementNamed(SignUp.routeName);
              },
              color: Colors.red[900],
            ),
          ],
        ),
      ),
    );
  }
}
