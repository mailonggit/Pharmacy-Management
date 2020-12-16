import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/signup/auth_screen.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final Function press;
  final haveAccount;
  const AlreadyHaveAnAccount({
    this.haveAccount = false,
    this.press,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
        Text(this.haveAccount 
            ? 'Don\'t have an account! '
            : 'Already have an account ', 
            style: TextStyle(fontSize: 15),),
        GestureDetector(
          onTap: this.press,
          child: Text(
            this.haveAccount ? 'Sign Up' : 'Sign In',
            style: TextStyle(
                color: Colors.red[600],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ],
    );
  }
}
