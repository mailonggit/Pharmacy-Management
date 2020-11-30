import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/already_have_an_account.dart';
import 'package:pharmacy_application/components/rounded_button.dart';
import 'package:pharmacy_application/components/rounded_input_field.dart';
import 'package:pharmacy_application/components/rounded_password_field.dart';
import 'package:pharmacy_application/components/text_field_container.dart';

import 'package:pharmacy_application/screens/login/background.dart';
import 'package:pharmacy_application/screens/signup/signup.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/leaf.png'),
          SizedBox(height: size.height * 0.03,),
          RoundedInputField(
            hintText: 'Your Username',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'Login',
            color: Colors.pink[600],
            click: () {},
          ),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAnAccount(
            click: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUp();
              }));
            },
          )
        ],
      ),
    );
  }
}
