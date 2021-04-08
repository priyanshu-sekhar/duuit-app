import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfilePic(height: 48),
          Padding(padding: EdgeInsets.only(right: 16)),
          Flexible(
            child: weeklyProgressWidget(),
            fit: FlexFit.loose,
          )
        ],
      ),
    );
  }

  Widget weeklyProgressWidget() {
    // 1 represents done on that day, 0 implies missed
    // first index is always Mon, last is Today
    const progress = [
      {
        'day': 'Mon',
        'done': true,
        'journal': true,
        'past': true,
      },
      {
        'day': 'Tue',
        'done': false,
        'journal': true,
        'past': true,
      },
      {
        'day': 'Wed',
        'done': true,
        'journal': true,
        'past': true,
      },
      {
        'day': 'Thu',
        'done': true,
        'journal': true,
        'past': true,
      },
      {
        'day': 'Fri',
        'done': true,
        'journal': true,
        'past': true,
      },
      {
        'day': 'Sat',
        'past': false,
        'done': false
      },
      {
        'day': 'Sun',
        'past': false,
        'done': false
      },
    ];


    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        progressCircle(progress[0]),
        Spacer(),
        progressCircle(progress[1]),
        Spacer(),
        progressCircle(progress[2]),
        // Flexible(child: Container(height: 2, color: Color(0xFF1071E2), margin: EdgeInsets.only(top: 24),)),
        Spacer(),
        progressCircle(progress[3]),
        Spacer(),
        progressCircle(progress[4]),
        Spacer(),
        progressCircle(progress[5]),
        Spacer(),
        progressCircle(progress[6])
      ],
    );
  }

  Widget progressCircle(progress) {
    // const Color border = progress['past'] != null  ? Color(0xFF1071E2) : Color.fromRGBO(0, 0, 0, 0.5);
    // const Color inner = progress['done'] ? Color(0xFF1071E2) : Colors.white;

    return Column(
      children: [
        Text(
          progress['day'],
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black45
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: progress['past'] ? Color(0xFF1071E2) : Color.fromRGBO(0, 0, 0, 0.5),
              width: 2
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 20,
          width: 20,
          child: Container(
            margin: EdgeInsets.all(1.5),
            height: 17.5,
            width: 17.5,
            decoration: BoxDecoration(
              color: progress['done'] ? Color(0xFF1071E2) : Colors.white,
              borderRadius: BorderRadius.circular(8.5)
            ),
          ),
        )
      ],
    );
  }
}