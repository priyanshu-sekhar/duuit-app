import 'package:duuit/src/blocs/auth_bloc.dart';
import 'package:flutter/cupertino.dart';

class AppAuthProvider extends InheritedWidget {
  final AuthBloc bloc;

  AppAuthProvider({Key? key, required Widget child})
      : bloc = AuthBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppAuthProvider>()!.bloc;
  }
}
