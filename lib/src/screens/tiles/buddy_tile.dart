import 'package:duuit/src/models/response/find_buddies_response.dart';
import 'package:duuit/src/models/response/goal_response.dart';
import 'package:duuit/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuddyTile extends StatelessWidget {
  final String profilePic;
  final FindBuddiesResponse item;

  BuddyTile({this.profilePic = 'assets/profile_pic.png', required this.item});

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
    // FIXME lol, fix this obviously
    GoalResponse goal = item.goals[0];

    return ExpansionTile(
      leading: Transform.translate(
        offset: Offset(5, 10),
        child: Image.asset(
          profilePic,
          height: 80,
        ),
      ),
      title: transformChild(child: username(item.name)),
      subtitle: transformChild(child: userSubtitle(goal)),
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
              alignText(text: goal.description)
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

  Row userSubtitle(GoalResponse goal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        userGoal(goal.name),
        Transform.translate(
          offset: Offset(35, 0),
          child: Text(
            goal.duration,
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

  Text userGoal(String name) {
    return Text(
      name.capitalize(),
      style: subtextStyle(),
    );
  }

  Text username(String text) {
    return Text(
      text,
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
