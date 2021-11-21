import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/app/pages/home/home_page.dart';
import 'package:idle_rpg_flutter/app/utils/redirect.dart';
import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/create_user.dart' as action;
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/selectors/selectors.dart';
import 'package:redux/redux.dart';

import '../login_page.dart';

class RegisterPageController extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  late bool _isAuthenticated;
  late Function(CreateUserCommand) _createUser;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, void>(
        converter: _connect,
        builder: (_, __) {
          if (_isAuthenticated) {
            redirectTo(context, HomePage.routeName);
            return Container();
          } else {
            return RegisterPageView(this);
          }
        },
      );

  void _connect(Store<AppState> store) {
    _isAuthenticated = isAuthenticatedSelector(store.state);
    _createUser = (command) {
      store.dispatch(action.createUser(command));
    };
  }

  handleRegistration() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var command = CreateUserCommand(
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    _createUser(command);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  String? passwordConfirmationValidator(String? confirmationPassword) {
    if (confirmationPassword == null) {
      return 'Re enter password confirmation';
    }

    if (passwordController.text != passwordConfirmationController.text) {
      return 'Password mismatch';
    }

    return null;
  }
}
