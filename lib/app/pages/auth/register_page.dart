import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:idle_rpg_flutter/app/pages/auth/widgets/form_container.dart';
import 'package:idle_rpg_flutter/app/pages/home/home_page.dart';
import 'package:idle_rpg_flutter/app/ui/ui.dart';

import 'package:idle_rpg_flutter/app/pages/page_layout.dart';
import 'package:idle_rpg_flutter/app/pages/auth/login_page.dart';
import 'package:idle_rpg_flutter/app/widgets/core.dart';
import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/create_user.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterPageController();
}

class RegisterPageController extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) => RegisterPageView(this);

  handleRegistration(dispatch) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var command = CreateUserCommand(
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    await dispatch(createUser(command));
    dispatch(NavigateToAction.replace(HomePage.routeName));
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

class RegisterPageView extends WidgetView<RegisterPage, RegisterPageController> {
  const RegisterPageView(RegisterPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      converter: (store) => store.dispatch,
      builder: (context, dispatch) => PageLayout(
        child: FormContainer(
          title: 'Créer mon compte',
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                UITextField(
                  controller: controller.firstnameController,
                  label: 'Prénom',
                  validator: controller.minLengthValidator(3),
                ),
                const SizedBox(height: 10),
                UITextField(
                  controller: controller.lastnameController,
                  label: 'Nom',
                  validator: controller.minLengthValidator(3),
                ),
                const SizedBox(height: 10),
                UITextField(
                  controller: controller.emailController,
                  label: 'Email',
                  validator: controller.emailValidator,
                ),
                const SizedBox(height: 50),
                UITextField(
                  controller: controller.passwordController,
                  label: 'Mot de passe',
                  validator: controller.passwordValidator,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                UITextField(
                  controller: controller.passwordConfirmationController,
                  label: 'Confirmation du mot de passe',
                  validator: controller.passwordConfirmationValidator,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                UIPrimaryButton(
                  label: "Créer mon compte",
                  onPressed: () {
                    controller.handleRegistration(dispatch);
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: UITextButton(
                    label: "J'ai déjà un compte",
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
