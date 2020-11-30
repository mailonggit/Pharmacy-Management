import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function click;
  final Color color;
  const RoundedButton({
    this.text,
    this.click,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          color: this.color,
          onPressed: this.click,
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
