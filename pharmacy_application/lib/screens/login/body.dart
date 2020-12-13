import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/already_have_an_account.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/components/rounded_input_field.dart';
import 'package:pharmacy_application/components/rounded_password_field.dart';
import 'package:pharmacy_application/screens/home/home_screen.dart';

import 'package:pharmacy_application/screens/login/background.dart';
import 'package:pharmacy_application/screens/signup/signup.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Image.asset('assets/images/10.png'),
            ),
            RoundedInputField(
              hintText: 'Your Username',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'Login',
              color: Colors.blue[900],
              press: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
            AlreadyHaveAnAccount(
              click: () {
                Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                ;
              },
            )
          ],
        ),
      ),
    );
  }
}
