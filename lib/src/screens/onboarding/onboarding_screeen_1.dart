import 'package:duuit/src/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          margin: EdgeInsets.only(left: 15, top: 20),
          child: Stack(
            children: [backButton(context), onboardingSection(context)],
          ),
        ));
  }

  Widget onboardingSection(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          profilePic(),
          userName(),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          userBio(),
          Padding(padding: EdgeInsets.only(bottom: 42)),
          continueButton(context),
          Padding(padding: EdgeInsets.only(bottom: 48)),
          Image.asset('assets/g1.jpg',)
        ],
      ),
      // color: Colors.orange,
    );
  }

  Widget backButton(BuildContext context) {
    return Positioned(
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF1071E2),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget continueButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        padding:
        MaterialStateProperty.all(EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 13)),
      ),
      child: Row(
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
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget profilePic() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset('assets/profile_pic.png'),
    );
  }

  Widget userName() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 45, right: 60),
      child: TextField(
        decoration: textFieldDecoration(hintText: 'Choose a cool username'),
      ),
    );
  }

  Widget userBio() {
    return Container(
      height: 144,
      margin: EdgeInsets.only(left: 45, right: 60),
      child: TextField(
        minLines: 10,
        maxLines: 10,
        decoration: textFieldDecoration(hintText: 'Write about yourself'),
      ),
    );
  }

  InputDecoration textFieldDecoration({String hintText}) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(10),
        focusedBorder: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        )
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black45)
    );
  }
}
