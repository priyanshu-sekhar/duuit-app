import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;

  Logo({this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo.png', height: height,);
  }
}