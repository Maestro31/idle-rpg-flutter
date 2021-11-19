import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/user_gateway.dart';
import 'package:idle_rpg_flutter/redux/auth/models/user.dart';

import '../exceptions.dart';

class FakeUserGateway implements UserGateway {
  String? accessToken;
  Map<String, User> users = {};

  FakeUserGateway();

  @override
  Future<void> createUser(CreateUserCommand command) async {
    final bool userExists = users.values.any((element) => element.email == command.email);

    if (userExists) {
      throw const UserCreationException("User with this email already exists");
    }

    users[command.password] = User(
      firstname: command.firstname,
      lastname: command.lastname,
      email: command.email,
    );
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final User user = users.entries
          .firstWhere((entry) => entry.key == password && entry.value.email == email)
          .value;
      accessToken = "${user.email}-${user.firstname}";
    } on StateError catch (_) {
      throw const InvalidCredentialsException("Invalid credentials");
    }
  }

  @override
  Future<User> me() async {
    final User? user = users[accessToken!];
    if (user == null) {
      throw const InvalidCredentialsException("Invalid access token");
    }

    return user;
  }
}