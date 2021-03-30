import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:duuit/extensions/string_extension.dart';
import 'package:duuit/values/category_colors.dart';

class CategoryHeader extends StatelessWidget with PreferredSizeWidget {
  final String? image;
  final String? header;
  final Color? backgroundColor;

  CategoryHeader({this.image, this.header, this.backgroundColor});

  @override
  Size get preferredSize => Size.fromHeight(170);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CategoryColors.colorMap[header!],
      // iconTheme: IconThemeData(color: Color(0xFF06172C)),
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.only(left: 13),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.translate(
              offset: Offset(-5, 0),
              child: headerAndIcon(context),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: notificationWidget(),
                  ),
                  timeSelector()                ],
              ),
            )
          ],
        ),
      ),
      toolbarHeight: 170,
    );
  }

  Widget notificationWidget() {
    return Row(
      children: [
        Text(
          'Notifications',
          style: categoryTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Container(
          // scale: 0.7,
          height: 25,
          child: Transform.scale(
            scale: 0.6,
            child: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        )
      ],
    );
  }

  Wrap headerAndIcon(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Color(0xFF06172C),
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  header!.capitalize(),
                  style: categoryTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0, 85),
              child: Image.asset(
                'assets/${image}_icon.png',
              ),
            ),
          ],
        ),
      ],
    );
  }

  TextStyle categoryTextStyle({double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
      color: Color(0xFF06172C),
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  Widget timeSelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: dropdownButton(width: 80, options: ['00:00']),
        ),
        Padding(padding: EdgeInsets.only(right: 10)),
        Flexible(
          child: dropdownButton(width: 110, options: ['Thursdays']),
        )
      ],
    );
  }

  Widget dropdownButton({double? width, required List<String> options}) {
    return Container(
      width: width,
      height: 27,
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: DropdownButton(
        value: options[0],
        items: options.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          );
        }).toList(),
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        isExpanded: true,
        onChanged: (dynamic newValue) {
          print(newValue);
        },
        underline: Container(),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 5,
            color: Color.fromRGBO(6, 23, 44, 0.09),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
