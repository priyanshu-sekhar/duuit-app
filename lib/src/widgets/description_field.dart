import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: TextField(
        decoration: textFieldDecoration(
            labelText: 'Description', hintText: 'I would like to achieve'),
        minLines: 4,
        maxLines: 4,
      ),
    );
  }

  InputDecoration textFieldDecoration({String hintText, String labelText}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10),
      focusedBorder: textFieldBorder(),
      enabledBorder: textFieldBorder(),
      labelText: labelText,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF06172C)),
      alignLabelWithHint: true,
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.black87),
    );
  }
}