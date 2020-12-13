import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/already_have_an_account.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/components/rounded_input_field.dart';
import 'package:pharmacy_application/components/rounded_password_field.dart';
import 'package:pharmacy_application/screens/login/login.dart';
import 'package:pharmacy_application/screens/signup/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Image.asset('assets/images/7.png'),
            ),
            RoundedInputField(
              hintText: 'Your Full Name',
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Your Username',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Password Again',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'Sign Up',
              color: Colors.red[900],
              press: () {},
            ),
            AlreadyHaveAnAccount(
              haveAccount: false,
              click: () {
                Navigator.of(context).pushReplacementNamed(Login.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
