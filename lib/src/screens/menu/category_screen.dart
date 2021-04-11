import 'package:duuit/src/args/menu/category_screen_args.dart';
import 'package:duuit/src/screens/tiles/progress_tile.dart';
import 'package:duuit/src/widgets/app_floating_button.dart';
import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:duuit/src/widgets/category_header.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = '/category';

  @override
  Widget build(BuildContext context) {
    final CategoryScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as CategoryScreenArgs;

    return Scaffold(
      appBar: CategoryHeader(
        image: args.category,
        header: args.header,
        backgroundColor: args.backgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24, left: 36, right: 36),
        child: Column(
          children: [
            dayHeaderWidget(),
            Padding(padding: EdgeInsets.only(bottom: 13)),
            ProgressTile()
          ],
        )
      ),
      floatingActionButton: AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer(),
    );
  }

  Widget dayHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRichText(
          fontSize: 24,
          header: 'Day ',
          highlightedText: '5 ',
          trailingText: 'of 14',
        ),
        Image.asset(
          'assets/calendar.png',
          height: 24,
        )
      ],
    );
  }


}