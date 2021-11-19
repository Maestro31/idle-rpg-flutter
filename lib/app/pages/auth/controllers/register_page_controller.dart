import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/create_user.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';

import '../login_page.dart';

class RegisterPageController extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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

  String? Function(String?) minLengthValidator(int count) {
    return (String? value) {
      if (value == null || value.length < count) {
        return 'Minimum length should be $count';
      }

      return null;
    };
  }

  String? emailValidator(String? email) {
    if (email == null) {
      return 'Email cannot be blank';
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return 'Email should have a valid format';
    }

    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null) {
      return 'Password cannot be blank';
    }

    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(password)) {
      return 'Password should have at least 8 letters, one digit and one upper case letter';
    }

    return null;
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
