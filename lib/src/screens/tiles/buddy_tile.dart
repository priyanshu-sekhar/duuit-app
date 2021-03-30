import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuddyTile extends StatelessWidget {
  final String profilePic;
  final String userName;
  final String description;
  final String goal;
  final String goalDuration;

  BuddyTile(
      {this.profilePic = 'assets/profile_pic.png',
      this.userName = 'Siddharth Dash',
      this.description =
          'Meri ek tang nakli hai...mai hockey ka bahut acha player tha.....ek din Uday bhai ko mere kisi baat par gussa aa gaya unhone meri hi hockey stick se meri tang tod di...par dil ke bahut ache hai turant hospital le gaye....meri nakli tang lagwayi or mujhe ye danda karid ke diya.....',
      this.goal = 'Workout',
      this.goalDuration = 'For 2 weeks'});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        child: Material(
          color: Colors.white,
          child: itemTile(),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      color: Color.fromRGBO(6, 23, 44, 0.09),
    );
  }

  Widget itemTile() {
    return ExpansionTile(
      leading: Transform.translate(
        offset: Offset(5, 10),
        child: Image.asset(
          profilePic,
          height: 80,
        ),
      ),
      title: transformChild(child: username()),
      subtitle: transformChild(child: userSubtitle()),
      tilePadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      children: [
        Transform.translate(
          offset: Offset(0, -15),
          child: Column(
            children: [
              Divider(color: Color.fromRGBO(0, 0, 0, 0.5)),
              Padding(padding: EdgeInsets.only(top: 8)),
              alignText(text: 'Description'),
              Padding(padding: EdgeInsets.only(top: 4)),
              alignText(text: description)
            ],
          ),
        ),
      ],
      childrenPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
    );
  }

  Transform transformChild({child}) {
    return Transform.translate(
      offset: Offset(0, 10),
      child: child,
    );
  }

  Align alignText({required text}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: subtextStyle(),
      ),
    );
  }

  Row userSubtitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        userGoal(),
        Transform.translate(
          offset: Offset(35, 0),
          child: Text(
            goalDuration,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Text userGoal() {
    return Text(
      goal,
      style: subtextStyle(),
    );
  }

  Text username() {
    return Text(
      userName,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17,
        color: Color(0xFF06172C),
        height: 1,
      ),
    );
  }

  TextStyle subtextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromRGBO(0, 0, 0, 0.5),
    );
  }
}
