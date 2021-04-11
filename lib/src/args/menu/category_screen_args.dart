import 'package:flutter/cupertino.dart';

class CategoryScreenArgs {
  final int goalId;
  final String? category;
  final String? header;
  final Color? backgroundColor;

  CategoryScreenArgs({
    required this.goalId,
    this.category,
    this.header,
    this.backgroundColor,
  });
}
