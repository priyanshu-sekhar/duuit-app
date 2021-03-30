import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String? route;

  ContinueButton({this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        padding:
        MaterialStateProperty.all(EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 13)),
      ),
      child: buttonContent(),
      onPressed: () {
        if (route != null)
          Navigator.pushNamed(context, route!);
        else
          showDialog(context: context, builder: (_) => AlertDialog(title: Text('aage kaam chal rha hai')));
      },
    );
  }

  Widget buttonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Continue',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 10)),
        Icon(
          Icons.keyboard_arrow_right_outlined,
          color: Colors.white,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}