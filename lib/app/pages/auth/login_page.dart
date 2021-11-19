import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/pages/auth/register_page.dart';
import 'package:idle_rpg_flutter/app/pages/auth/widgets/form_container.dart';
import 'package:idle_rpg_flutter/app/pages/page_layout.dart';
import 'package:idle_rpg_flutter/app/ui/ui.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: FormContainer(
        title: 'Connexion',
        child: Column(
          children: [
            const UITextField(label: 'Email'),
            const SizedBox(height: 10),
            const UITextField(label: 'Mot de passe'),
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
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
