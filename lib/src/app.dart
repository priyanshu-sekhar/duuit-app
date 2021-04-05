import 'package:duuit/src/blocs/auth_bloc.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_1_bloc.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_3_bloc.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_5_bloc.dart';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/login_screen.dart';
import 'package:duuit/src/screens/menu/user_profile_screen.dart';
import 'package:duuit/src/screens/menu/category_screen.dart';
import 'package:duuit/src/screens/menu/home_screen.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_1.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_2.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_3.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_4.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_5.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static const String rootRoute = '/';
  final AccessToken? accessToken;
  final UserDetailsResponse? userDetailsResponse;
  
  App({this.accessToken, this.userDetailsResponse});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthBloc()),
        Provider(create: (_) => OnboardingScreen1Bloc()),
        Provider(create: (_) => OnboardingScreen3Bloc()),
        Provider(create: (_) => OnboardingScreen5Bloc())
      ],
      child: MaterialApp(
        title: 'duuit!!',
        theme: ThemeData(
          primaryColor: Color(0xFF1071E2),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }),
        ),
        routes: {
          rootRoute: (context) {
            if (accessToken == null)
              return LoginScreen();
            if (userDetailsResponse == null)
              return OnboardingScreen1(accessToken: accessToken);
            return OnboardingScreen2();
          },
          OnboardingScreen1.route: (context) => OnboardingScreen1(),
          OnboardingScreen2.route: (context) => OnboardingScreen2(),
          OnboardingScreen3.route: (context) => OnboardingScreen3(),
          OnboardingScreen4.route: (context) => OnboardingScreen4(),
          OnboardingScreen5.route: (context) {
            OnboardingScreen5Bloc bloc = Provider.of<OnboardingScreen5Bloc>(context);
            bloc.fetchBuddies();

            return OnboardingScreen5();
          },
          HomeScreen.route: (context) => HomeScreen(),
          CategoryScreen.route: (context) => CategoryScreen(),
          UserProfileScreen.route: (context) => UserProfileScreen(),
        },
      ),
    );
  }
}
