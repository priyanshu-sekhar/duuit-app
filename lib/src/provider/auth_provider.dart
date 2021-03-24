import 'package:duuit/src/blocs/auth_bloc.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends InheritedWidget {
  final AuthBloc bloc;

  AuthProvider({Key key, Widget child})
      : bloc = AuthBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>().bloc;
  }
}
