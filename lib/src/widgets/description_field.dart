import 'package:duuit/src/blocs/onboarding/onboarding_screen_3_bloc.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionField extends StatelessWidget {
  final Stream<String>? stream;
  final Function(String)? onChanged;

  DescriptionField({this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return TextField(
              decoration: textFieldDecoration(
                labelText: 'Description',
                hintText: 'I would like to achieve',
                errorText: snapshot.error
              ),
              minLines: 4,
              maxLines: 4,
              onChanged: onChanged,
            );
          }),
    );
  }

  InputDecoration textFieldDecoration({String? hintText, String? labelText, errorText}) {
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
      errorText: errorText
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.black87),
    );
  }
}
