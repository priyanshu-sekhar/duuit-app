import 'package:flutter/cupertino.dart';

class OnboardingHeader extends StatelessWidget {
  final String header;
  final String highlightedText;

  OnboardingHeader({this.header, this.highlightedText});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
        text: TextSpan(
            text: header,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xFF06172C)
            ),
            children: <TextSpan>[
              TextSpan(
                  text: highlightedText,
                  style: TextStyle(
                      color: Color(0xFF1071E2)
                  )
              )
            ]
        ),
        softWrap: true,
      )
    );
  }
}