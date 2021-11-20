import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/app/pages/auth/login_page.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';

import '../register_page.dart';

class LoginPageController extends State<LoginPage> {
  late dynamic dispatch;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
      onInit: (store) {
        dispatch = store.dispatch;
      },
      builder: (_, __) => LoginPageView(this));

  void navigateToRegistration(BuildContext context) {
    Navigator.pushNamed(context, RegisterPage.routeName);
  }
}
