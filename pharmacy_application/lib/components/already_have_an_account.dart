import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final Function click;
  final bool haveAccount;
  const AlreadyHaveAnAccount({
    this.haveAccount = true,
    this.click,
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
          onTap: this.click,
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
