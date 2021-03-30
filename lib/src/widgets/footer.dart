import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 40, right: 30),
      child: Row(
        children: [
          buildIcon(image: 'home-active'),
          Spacer(),
          buildIcon(image: 'file'),
          Spacer(),
          buildIcon(image: 'message'),
          Spacer(),
          buildIcon(image: 'user')
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 5,
            color: Color.fromRGBO(0, 0, 0, 0.08),
          ),
        ],
      ),
    );
  }

  Widget buildIcon({String? image}) {
    return Image.asset(
      'assets/$image.png',
      height: 36,
    );
  }
}