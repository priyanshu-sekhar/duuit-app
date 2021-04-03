import 'package:duuit/src/args/menu/cateogry_screen_args.dart';
import 'package:duuit/src/widgets/app_floating_button.dart';
import 'package:duuit/src/widgets/category_header.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const route = '/category';

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
      floatingActionButton: AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer(),
    );
  }
}