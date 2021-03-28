import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeWidget(),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              AppRichText(
                highlightedText: 'Continue with your goals',
                fontSize: 22,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 45,
          ),
          backgroundColor: Color(0xFF1071E2),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Footer());
  }

  Widget welcomeWidget() {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePic(
              height: 60,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.only(right: 20), // this is to prevent overflow to more icon
                child: AppRichText(
                  header: 'Welcome, ',
                  highlightedText: 'Sid',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          child: Icon(
            Icons.more_horiz_sharp,
            color: Color(0xFF1071E2),
          ),
          right: 0,
          top: 20
        )
      ],
    );
  }
}
