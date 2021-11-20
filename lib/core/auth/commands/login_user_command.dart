import 'package:idle_rpg_flutter/core/shared/command.dart';

class LoginUserCommand extends Command {
  final String email;
  final String password;

  LoginUserCommand({
    required this.email,
    required this.password,
  });
}
