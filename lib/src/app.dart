import 'package:duuit/src/provider/auth_provider.dart';
import 'package:duuit/src/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      child: MaterialApp(
        title: 'duuit!!',
        theme: ThemeData(
          primaryColor: Color(0xFF1071E2)
        ),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          final bloc = AuthProvider.of(context);

          return LoginScreen();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
    }
  }
}