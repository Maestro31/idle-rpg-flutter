import 'package:idle_rpg_flutter/core/shared/command.dart';

class CreateUserCommand extends Command {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  CreateUserCommand({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });
}
