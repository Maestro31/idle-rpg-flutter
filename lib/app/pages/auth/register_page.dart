import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/pages/auth/widgets/form_container.dart';
import 'package:idle_rpg_flutter/app/ui/ui.dart';

import 'package:idle_rpg_flutter/app/pages/page_layout.dart';
import 'package:idle_rpg_flutter/app/validators/validators.dart';
import 'package:idle_rpg_flutter/app/widgets/core.dart';

import 'controllers/register_page_controller.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterPageController();
}

class RegisterPageView extends WidgetView<RegisterPage, RegisterPageController> {
  const RegisterPageView(RegisterPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: FormContainer(
        title: 'Créer mon compte',
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              UITextField(
                controller: controller.firstnameController,
                label: 'Prénom',
                validator: minLengthValidator(3),
              ),
              const SizedBox(height: 10),
              UITextField(
                controller: controller.lastnameController,
                label: 'Nom',
                validator: minLengthValidator(3),
              ),
              const SizedBox(height: 10),
              UITextField(
                controller: controller.emailController,
                label: 'Email',
                validator: emailValidator,
              ),
              const SizedBox(height: 50),
              UITextField(
                controller: controller.passwordController,
                label: 'Mot de passe',
                validator: passwordValidator,
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
                onPressed: controller.handleRegistration,
              ),
              const SizedBox(height: 20),
              Center(
                child: UITextButton(
                  label: "J'ai déjà un compte",
                  onPressed: () {
                    controller.navigateToLogin(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
