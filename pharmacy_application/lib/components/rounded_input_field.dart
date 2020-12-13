import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;  
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    this.hintText,    
    this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: this.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          hintText: this.hintText,
          border: InputBorder.none,                    
        ),            
      ),      
    );
  }
}