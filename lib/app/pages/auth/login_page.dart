import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/pages/auth/widgets/form_container.dart';
import 'package:idle_rpg_flutter/app/pages/page_layout.dart';
import 'package:idle_rpg_flutter/app/ui/ui.dart';
import 'package:idle_rpg_flutter/app/validators/validators.dart';
import 'package:idle_rpg_flutter/app/widgets/core.dart';

import 'controllers/login_page_controller.dart';

class LoginPageArguments {
  final String backRoute;

  LoginPageArguments(this.backRoute);
}

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageController();
}

class LoginPageView extends WidgetView<LoginPage, LoginPageController> {
  const LoginPageView(LoginPageController controller, {Key? key}) : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: FormContainer(
        title: 'Connexion',
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              UITextField(
                controller: controller.emailController,
                label: 'Email',
                validator: emailValidator,
              ),
              const SizedBox(height: 10),
              UITextField(
                controller: controller.passwordController,
                label: 'Mot de passe',
                validator: notBlankValidator,
                obscureText: true,
              ),
              const SizedBox(height: 50),
              UIPrimaryButton(
                label: 'Se connecter',
                onPressed: controller.handleSubmitLogin,
              ),
              const SizedBox(height: 20),
              Center(
                child: UITextButton(
                  label: "Je n'ai pas encore de compte",
                  onPressed: controller.navigateToRegistration,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
