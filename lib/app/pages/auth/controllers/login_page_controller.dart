import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/login_page.dart';
import 'package:idle_rpg_flutter/app/pages/home/home_page.dart';
import 'package:idle_rpg_flutter/app/utils/redirect.dart';
import 'package:idle_rpg_flutter/core/auth/commands/login_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/login_user.dart' as action;
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/selectors/selectors.dart';
import 'package:redux/redux.dart';

import '../register_page.dart';

class LoginPageController extends State<LoginPage> {
  late final dynamic dispatch;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late String _backRouteName;

  late bool _isAuthenticated;
  late Function(LoginUserCommand) _loginUser;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as LoginPageArguments?;
    _backRouteName = args?.backRoute ?? HomePage.routeName;

    return StoreConnector<AppState, void>(
      converter: _connect,
      builder: (_, __) {
        if (_isAuthenticated) {
          redirectTo(context, HomePage.routeName);
          return Container();
        } else {
          return LoginPageView(this);
        }
      },
    );
  }

  void _connect(Store<AppState> store) {
    _isAuthenticated = isAuthenticatedSelector(store.state);
    _loginUser = (command) {
      store.dispatch(action.loginUser(command));
    };
  }

  void navigateToRegistration() {
    Navigator.pushNamed(context, RegisterPage.routeName);
  }

  void handleSubmitLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var command = LoginUserCommand(
      email: emailController.text,
      password: passwordController.text,
    );

    await _loginUser(command);
    Navigator.pushNamed(context, _backRouteName);
  }
}
