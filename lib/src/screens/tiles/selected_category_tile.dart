import 'package:flutter/cupertino.dart';

class SelectedCategoryTile extends StatelessWidget {
  final String category;
  final String goal;

  SelectedCategoryTile({this.category, this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          FractionallySizedBox(
            child: Image.asset(
              'assets/${category}_large.png',
            ),
            widthFactor: 1,
          ),
          Positioned(
            bottom: 35,
            left: 20,
            width: 150,
            child: Text(
              goal,
              style: TextStyle(
                color: Color(0xFF06172C),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }
}
