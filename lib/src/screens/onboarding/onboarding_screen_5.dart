import 'package:duuit/src/args/menu/home_screen_args.dart';
import 'package:duuit/src/args/onboarding/onboarding_screen_5_args.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_5_bloc.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/menu/home_screen.dart';
import 'package:duuit/src/screens/tiles/buddy_tile.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:duuit/src/widgets/refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen5 extends StatelessWidget {
  static const String route = '/onboarding/5';

  @override
  Widget build(BuildContext context) {
    OnboardingScreen5Bloc bloc = Provider.of<OnboardingScreen5Bloc>(context);
    OnboardingScreen5Args args = fetchArgs(context);

    return Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            OnboardingHeader(
              header: 'Let\'s ',
              highlightedText: 'duuit!',
            ),
            subtitle(),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.only(left: 36, right: 36),
              child: buddyList(bloc),
            ),
            Spacer(),
            Padding(padding: EdgeInsets.only(top: 24)),
            submit(context, args),
            Padding(padding: EdgeInsets.only(top: 24)),
            Image.asset('assets/g3.jpg'),
            Padding(padding: EdgeInsets.only(bottom: 66))
          ],
        ),
      ),
    );
  }

  Widget submit(BuildContext context, OnboardingScreen5Args args) {
    return ContinueButton(
      onPressed: () {
        Navigator.pushNamed(context, HomeScreen.route);
      },
    );
  }

  Widget subtitle() {
    return Transform.translate(
      offset: Offset(-25, 0),
      child: Text(
        'Find buddies to do tasks with.',
        style: TextStyle(
          color: Color(0xFF06172C),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buddyList(OnboardingScreen5Bloc bloc) {
    return StreamBuilder(
      stream: bloc.buddies,
      builder: (context, AsyncSnapshot<List<UserDetailsResponse>> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Refresh(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return BuddyTile(item: snapshot.data![index]);
            },
          ),
        );
      },
    );
  }

  static OnboardingScreen5Args fetchArgs(BuildContext context) {
    final OnboardingScreen5Args args =
        ModalRoute.of(context)!.settings.arguments as OnboardingScreen5Args;
    return args;
  }
}
