import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/create_user.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';

import '../login_page.dart';

class RegisterPageController extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  late final dynamic dispatch;

  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
      onInit: (store) {
        dispatch = store.dispatch;
      },
      builder: (_, __) => RegisterPageView(this));

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

    dispatch(createUser(command));
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
