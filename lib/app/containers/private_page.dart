import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/login_page.dart';
import 'package:idle_rpg_flutter/app/pages/home/home_page.dart';
import 'package:idle_rpg_flutter/app/utils/redirect.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/auth/models/auth_status.dart';

class PrivatePage extends StatelessWidget {
  final Widget child;
  final String? backRouteName;

  const PrivatePage({Key? key, required this.child, this.backRouteName = HomePage.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.auth.status == AuthStatus.connected,
      builder: (context, isAuthenticated) {
        if (isAuthenticated) {
          return child;
        }

        String backTo = backRouteName == null || backRouteName == LoginPage.routeName
            ? HomePage.routeName
            : backRouteName!;

        redirectTo(context, LoginPage.routeName, arguments: LoginPageArguments(backTo));
        return Container();
      },
    );
  }
}
