import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function()? onPressed;

  ContinueButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    // FIXME try changing to using theme for color, currently it reduces to lesser opacity on enabled
    // Color color = Theme.of(context).colorScheme.primary;
    Color color = Color(0xFF1071E2);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return color.withOpacity(0.5);
            return color;
          },
        ),
        // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        padding: MaterialStateProperty.all(
            EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 13)),
      ),
      child: buttonContent(),
      onPressed: onPressed,
    );
  }

  Widget buttonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Continue',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
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
