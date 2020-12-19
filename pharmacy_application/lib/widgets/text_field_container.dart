import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {  
  final Widget child;
  const TextFieldContainer({    
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height* 0.08,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),  
        border: Border.all(width: 3, color: Colors.black),
      ),
      child: child,
    );
  }
}
