import 'package:flutter/cupertino.dart';

class ProfilePic extends StatelessWidget {
  final double? height;

  ProfilePic({this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        'assets/profile_pic.png',
        height: height != null ? height : null,
      ),
    );
  }
}
