import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/redux/auth/models/user.dart';

abstract class UserGateway {
  Future<void> createUser(CreateUserCommand command);
  Future<void> login(String email, String password);
  Future<User> me();
}
