import 'package:duuit/src/screens/tiles/selected_category_tile.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileSummary(),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                  'Meri ek tang nakli hai...mai hockey ka bahut acha player tha.....',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5)
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Center(
              child: Text(
                'Current Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            currentActivityList(),
          ],
        ),
      ),
      // floatingActionButton: AppFloatingButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: Footer(),
    );
  }

  Widget profileSummary() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePic(height: 85,),
        Padding(padding: EdgeInsets.only(left: 16)),
        Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  'Dash',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  'Last Login: Today',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 6)),
                Text(
                  'Member Since: Jan\'21',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
              ],
            )
        )
      ],
    );
  }

  Widget currentActivityList() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: dayCountDown('5', '14'),
        ),
        SelectedCategoryTile(
          category: 'meditate',
          goal: 'Mediate 15 mins every day',
        ),
        duuitButton(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: dayCountDown('17', '28'),
        ),
        SelectedCategoryTile(
          category: 'reading',
          goal: 'Read 15 pages every day',
        ),
        duuitButton(),
      ],
    );
  }

  Widget dayCountDown(String currentDay, String totalDays) {
    return RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
        children: <TextSpan>[
          new TextSpan(text: 'Day '),
          new TextSpan(text: '$currentDay', style: new TextStyle(color: Color(0xFF1071E2))),
          new TextSpan(text: ' of $totalDays'),
        ]
      ));
  }

  Widget duuitButton() {
    return Center(
      child: Container(
        width: 70,
        child: ElevatedButton(
          onPressed: () {}, 
          child: Text('duuit!', style: TextStyle(fontSize: 13)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ),
    );
  }

}
