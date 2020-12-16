import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/already_have_an_account.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/components/rounded_input_field.dart';
import 'package:pharmacy_application/components/rounded_password_field.dart';
import 'package:pharmacy_application/providers/auth_provider.dart';
import 'package:pharmacy_application/screens/login/login.dart';
import 'package:pharmacy_application/screens/signup/background.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  var fullName, username, password, confirmPassword;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    Future<void> _onSubmit() async {
      await Provider.of<AuthProvider>(context, listen: false).signup(
        _authData['email'],
        _authData['password'],
      );
    }

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
              onChanged: (value) {
                fullName = value;
              },
            ),
            RoundedInputField(
              hintText: 'Your Username',
              onChanged: (value) {
                _authData['email'] = value;
              },
            ),
            RoundedPasswordField(
              hintText: 'Password',
              onChanged: (value) {
                _authData['password'] = value;
              },
            ),
            RoundedPasswordField(
              hintText: 'Confirm Password',
              onChanged: (value) {
                confirmPassword = value;
              },
            ),
            RoundedButton(
              text: 'Sign Up',
              color: Colors.red[900],
              press: () {
                Navigator.of(context).pushNamed(Login.routeName);
              },
            ),
            AlreadyHaveAnAccount(
              haveAccount: false,
              press: () {
                Navigator.of(context).pushReplacementNamed(Login.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
