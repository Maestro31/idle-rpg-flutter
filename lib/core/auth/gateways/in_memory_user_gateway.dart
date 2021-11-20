import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/user_gateway.dart';
import 'package:idle_rpg_flutter/core/shared/command.dart';
import 'package:idle_rpg_flutter/redux/auth/models/user.dart';

class InMemoryUserGateway implements UserGateway {
  Command? lastCreateUserCommand;
  String? lastLoginEmail;
  String? lastLoginPassword;
  Exception? exceptionToRaise;
  User? currentUser;

  @override
  Future<void> createUser(CreateUserCommand command) async {
    _raiseIfRequested();
    lastCreateUserCommand = command;
  }

  @override
  Future<void> login(String email, String password) async {
    _raiseIfRequested();

    lastLoginEmail = email;
    lastLoginPassword = password;
  }

  @override
  Future<User> me() async {
    _raiseIfRequested();

    return currentUser!;
  }

  shouldThrowError(Exception exception) {
    exceptionToRaise = exception;
  }

  shouldReturnMeWith(User user) {
    currentUser = user;
  }

  _raiseIfRequested() {
    if (exceptionToRaise != null) {
      throw exceptionToRaise!;
    }
  }
}
