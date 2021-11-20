import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/app/pages/auth/widgets/form_container.dart';
import 'package:idle_rpg_flutter/app/pages/page_layout.dart';
import 'package:idle_rpg_flutter/app/ui/ui.dart';
import 'package:idle_rpg_flutter/app/widgets/core.dart';

import 'controllers/login_page_controller.dart';

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
        child: Column(
          children: [
            UITextField(
              controller: controller.emailController,
              label: 'Email',
            ),
            const SizedBox(height: 10),
            UITextField(
              controller: controller.passwordController,
              label: 'Mot de passe',
            ),
            const SizedBox(height: 50),
            UIPrimaryButton(
              label: 'Se connecter',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Center(
              child: UITextButton(
                label: "Je n'ai pas encore de compte",
                onPressed: () {
                  controller.navigateToRegistration(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
