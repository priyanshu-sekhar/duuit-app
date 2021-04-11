import 'package:duuit/src/args/menu/home_screen_args.dart';
import 'package:duuit/src/blocs/menu/user_bloc.dart';
import 'package:duuit/src/models/response/goal_response.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/tiles/feed_tile.dart';
import 'package:duuit/src/screens/tiles/selected_category_tile.dart';
import 'package:duuit/src/widgets/app_floating_button.dart';
import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeWidget(bloc),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            AppRichText(
              highlightedText: 'Continue with your goals',
              fontSize: 22,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Flexible(
              flex: 2,
              child: selectedCategoriesList(bloc),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            viewAllWidget(),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            feedHeaderWidget(),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Flexible(
              flex: 2,
              child: feedList(),
            )
          ],
        ),
      ),
      floatingActionButton: AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer(),
    );
  }

  Widget welcomeWidget(UserBloc bloc) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePic(
              height: 60,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.only(right: 20),
                // this is to prevent overflow to more icon
                child: StreamBuilder(
                  stream: bloc.userDetails,
                  builder: (BuildContext context, AsyncSnapshot<UserDetailsResponse> snapshot) {
                    if (!snapshot.hasData) return Container();

                    return AppRichText(
                      header: 'Welcome, ',
                      highlightedText: snapshot.data!.name,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
            child: Icon(
              Icons.more_horiz_sharp,
              color: Color(0xFF1071E2),
            ),
            right: 0,
            top: 20)
      ],
    );
  }

  Widget feedHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRichText(
          highlightedText: 'Feed',
          fontSize: 24,
        ),
        Text(
          'see all',
          style: TextStyle(
              color: Color(0xFF1071E2),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: Color(0xFF1071E2)),
        )
      ],
    );
  }

  Widget feedList() {
    return ListView(
      shrinkWrap: true,
      children: [
        FeedTile(
          text: 'has completed a ',
          highlightedText: '5 day streak',
        ),
        FeedTile(
          text: 'has ',
          warningText: 'missed a day',
        ),
      ],
    );
  }

  Widget viewAllWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppRichText(
          highlightedText: 'View All',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Color(0xFF1071E2),
        )
      ],
    );
  }

  Widget selectedCategoriesList(UserBloc bloc) {
    return StreamBuilder(
      stream: bloc.userDetails,
      builder: (BuildContext context, AsyncSnapshot<UserDetailsResponse> snapshot) {
        if (!snapshot.hasData)
          return Container();

        List<GoalResponse> userGoals = snapshot.data!.goals;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: userGoals.length,
          itemBuilder: (BuildContext context, int index) {
            GoalResponse item = userGoals[index];

            return SelectedCategoryTile(
              goalId: item.id,
              goal: item.description,
              category: item.name,
            );
          },
        );
      },
    );
  }

  static HomeScreenArgs fetchArgs(BuildContext context) {
    final HomeScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as HomeScreenArgs;
    return args;
  }
}
