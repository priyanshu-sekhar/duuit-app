import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: child, onRefresh: () async {
    });
  }
}