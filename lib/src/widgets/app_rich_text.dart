import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String leadingText;
  final String header;
  final String highlightedText;
  final double fontSize;

  AppRichText({
    this.leadingText = '',
    this.header,
    this.highlightedText,
    this.fontSize = 30
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: leadingText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1071E2),
          ),
          children: <TextSpan>[
            TextSpan(
              text: header,
              style: TextStyle(
                color: Color(0xFF06172C),
              ),
            ),
            TextSpan(
              text: highlightedText,
              style: TextStyle(
                color: Color(0xFF1071E2),
              ),
            )
          ]),
      softWrap: true,
    );
  }
}