import 'package:duuit/src/widgets/app_title.dart';
import 'package:duuit/src/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Logo(
            height: 36,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          AppTitle(
            fontSize: 30,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      toolbarHeight: 110,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      elevation: 5.0,
    );
  }
}
