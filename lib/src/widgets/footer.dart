import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 40, right: 30),
      child: Row(
        children: [
          buildIcon(image: 'home-active', route: '/home', context: context),
          Spacer(),
          buildIcon(image: 'file', route: '/home', context: context),
          Spacer(),
          buildIcon(image: 'message', route: '/home', context: context),
          Spacer(),
          buildIcon(image: 'user', route: '/profile', context: context)
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

  Widget buildIcon({String? image, required String route, required BuildContext context}) {
    return IconButton(
      icon: Image.asset('assets/$image.png'),
      iconSize: 36,
      color: Color(0xFF1071E2),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}