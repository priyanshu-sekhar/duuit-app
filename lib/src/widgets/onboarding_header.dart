import 'package:duuit/src/widgets/app_back_button.dart';
import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:flutter/cupertino.dart';

class OnboardingHeader extends StatelessWidget {
  final String header;
  final String highlightedText;

  OnboardingHeader({this.header, this.highlightedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 64, top: 30),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBackButton(),
          header != null ? buildHeader() : Container()
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Flexible(
        child: AppRichText(
      header: header,
      highlightedText: highlightedText,
    ));
  }
}
