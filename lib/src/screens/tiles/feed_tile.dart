import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  String highlightedText;
  String warningText;
  String text;
  
  FeedTile({this.text, this.warningText, this.highlightedText});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          infoWidget(),
          Padding(padding: EdgeInsets.only(bottom: 4)),
          actionWidget(),
          Padding(padding: EdgeInsets.only(bottom: 4))
        ],
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
    );
  }

  Widget infoWidget() {
    return Row(
      children: [
        Image.asset(
          'assets/avatar.png',
          height: 40,
        ),
        Padding(padding: EdgeInsets.only(right: 4)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: detailsWidget(),
              ),
              timestampWidget(),
            ],
          ),
        )
      ],
    );
  }

  Widget actionWidget() {
    return Row(
      children: [
        actionButton(iconData: Icons.favorite_border_sharp, text: 'like'),
        Padding(padding: EdgeInsets.only(right: 16)),
        actionButton(iconData: Icons.star_border_rounded, text: 'react'),
        Padding(padding: EdgeInsets.only(right: 16)),
        actionButton(image: 'message-circle', text: 'message')
      ],
    );
  }

  Widget actionButton({IconData iconData, String text, String image}) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: Color.fromRGBO(0, 0, 0, 0.07),
            ),
          ]),
      child: Row(
        children: [
          iconData != null
              ? Icon(
            iconData,
            color: Color(0xFF1071E2),
            size: 22,
          )
              : Container(),
          image != null
              ? Image.asset(
            'assets/$image.png',
            color: Color(0xFF1071E2),
            height: 22,
          )
              : Container(),
          Padding(padding: EdgeInsets.only(right: 2)),
          Text(
            text,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget detailsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppRichText(
          header: 'Jason Meyer',
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        AppRichText(
          header: text,
          highlightedText: highlightedText,
          warningText: warningText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }

  Widget timestampWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [timestampText('02/02/2021'), timestampText('5:30 pm')],
    );
  }

  Widget timestampText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }
}