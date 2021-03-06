import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String leadingText;
  final String? header;
  final String? highlightedText;
  final String? warningText;
  final String? trailingText;
  final double fontSize;
  final FontWeight fontWeight;

  AppRichText({
    this.leadingText = '',
    this.header,
    this.highlightedText,
    this.warningText = '',
    this.trailingText = '',
    this.fontSize = 30,
    this.fontWeight = FontWeight.w800
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: leadingText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
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
            ),
            TextSpan(
              text: warningText,
              style: TextStyle(
                color: Color(0xFFF86E20),
              ),
            ),
            TextSpan(
              text: trailingText,
              style: TextStyle(
                color: Color(0xFF06172C),
              ),
            )
          ]),
      softWrap: true,
    );
  }
}
