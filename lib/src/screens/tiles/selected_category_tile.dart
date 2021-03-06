import 'package:duuit/src/args/menu/category_screen_args.dart';
import 'package:duuit/src/screens/menu/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedCategoryTile extends StatelessWidget {
  final int goalId;
  final String? category;
  final String? goal;

  SelectedCategoryTile({required this.goalId, this.category, this.goal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryScreen.route,
          arguments: CategoryScreenArgs(
            goalId: goalId,
            category: category,
            header: category,
            backgroundColor: Color(0xFFA1A5FF)
          ),
        );
      },
      child: Container(
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
                goal!,
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
      ),
    );
  }
}
