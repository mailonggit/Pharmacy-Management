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
            Text("Signup image"),
            RoundedInputField(),
            RoundedPasswordField(),
            RoundedButton(
              text: 'Sign Up',
              color: Colors.green[600],
              click: () {},
            ),
            AlreadyHaveAnAccount(
              haveAccount: false,
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
