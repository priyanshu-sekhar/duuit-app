import 'package:duuit/src/widgets/app_floating_button.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  static const String route = '/activity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      floatingActionButton: AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer(),
    );
  }
}