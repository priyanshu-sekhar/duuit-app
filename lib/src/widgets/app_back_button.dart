import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -5),
      child:  IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF1071E2),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}