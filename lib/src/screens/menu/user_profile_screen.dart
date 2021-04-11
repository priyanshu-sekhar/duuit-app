import 'package:duuit/src/args/menu/user_profile_screen_args.dart';
import 'package:duuit/src/blocs/menu/user_bloc.dart';
import 'package:duuit/src/models/response/goal_response.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/tiles/selected_category_tile.dart';
import 'package:duuit/src/widgets/app_floating_button.dart';
import 'package:duuit/src/widgets/footer.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  static const String route = '/profile';

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
            profileWidget(bloc),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Center(
              child: Text('Current Activity',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(padding: EdgeInsets.only(bottom: 18)),
            Expanded(
              child: currentActivityList(bloc),
            )
          ],
        ),
      ),
      floatingActionButton: AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer(),
    );
  }

  Widget profileWidget(UserBloc bloc) {
    return StreamBuilder(
      stream: bloc.userDetails,
      builder: (BuildContext context, AsyncSnapshot<UserDetailsResponse> snapshot) {
        if (!snapshot.hasData)
          return Container();

        UserDetailsResponse userDetails = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileSummary(userDetails),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Text(
              userDetails.bio,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget profileSummary(UserDetailsResponse userDetails) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePic(
          height: 85,
        ),
        Padding(padding: EdgeInsets.only(left: 16)),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              userDetails.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              'Last Login: Today',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 6)),
            Text(
              'Member Since: Jan\'21',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ))
      ],
    );
  }

  Widget currentActivityList(UserBloc bloc) {
    return StreamBuilder(
      stream: bloc.userDetails,
      builder: (BuildContext context, AsyncSnapshot<UserDetailsResponse> snapshot) {
        if (!snapshot.hasData) return Container();

        List<GoalResponse> userGoals = snapshot.data!.goals;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: userGoals.length,
          itemBuilder: (BuildContext context, int index) {
            GoalResponse item = userGoals[index];

            return Column(
              children: [
                Container(
                  child: dayCountDown('5', '14'),
                  alignment: Alignment.centerLeft,
                ),
                Padding(padding: EdgeInsets.only(bottom: 7)),
                SelectedCategoryTile(
                  goalId: item.id,
                  category: item.name,
                  goal: item.description,
                ),
                duuitButton()
              ],
            );
          },
        );
      },
    );
  }

  Widget dayCountDown(String currentDay, String totalDays) {
    return RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          new TextSpan(text: 'Day '),
          new TextSpan(
              text: '$currentDay',
              style: new TextStyle(color: Color(0xFF1071E2))),
          new TextSpan(text: ' of $totalDays'),
        ],
      ),
    );
  }

  Widget duuitButton() {
    return Center(
      child: Container(
        width: 70,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('duuit!', style: TextStyle(fontSize: 13)),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF1071E2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ),
    );
  }

  static UserProfileScreenArgs fetchArgs(BuildContext context) {
    final UserProfileScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as UserProfileScreenArgs;
    return args;
  }
}
