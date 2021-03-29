import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 45,
      ),
      backgroundColor: Color(0xFF1071E2),
      onPressed: () {},
    );
  }
}