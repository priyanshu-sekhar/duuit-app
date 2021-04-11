import 'package:duuit/src/app.dart';
import 'package:duuit/src/args/menu/category_screen_args.dart';
import 'package:duuit/src/models/request/fetch_user_progress_request.dart';
import 'package:duuit/src/models/response/fetch_goal_progress_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CategoryScreenBloc {
  final _resource = Resource();
  final _progress = PublishSubject<List<FetchGoalProgressResponse>>();
  final _recentProgress = PublishSubject<List<FetchGoalProgressResponse>>();

  Stream<List<FetchGoalProgressResponse>> get progress => _progress.stream;
  Stream<List<FetchGoalProgressResponse>> get recentProgress => _recentProgress.stream;

  fetchGoalProgress(int goalId, FetchUserProgressRequest request) async {
    final progress = await _resource.fetchGoalProgress(goalId, request);
    _progress.add(progress);
  }
  
  fetchGoalProgressRecent(BuildContext context) async {
    CategoryScreenArgs args = App.fetchArgs(context);
    final recentProgress = await _resource.fetchGoalRecentProgress(args.goalId);
    
    _recentProgress.add(recentProgress);
  }

  dispose() {
    _progress.close();
    _recentProgress.close();
  }
}