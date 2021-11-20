import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/user_gateway.dart';
import 'package:idle_rpg_flutter/redux/auth/models/user.dart';

import '../exceptions.dart';

class FakeUserGateway implements UserGateway {
  User? _currentUser;
  final Map<String, User> _users = {};

  FakeUserGateway();

  @override
  Future<void> createUser(CreateUserCommand command) async {
    final bool userExists = _users.values.any((element) => element.email == command.email);

    if (userExists) {
      throw const UserCreationException("User with this email already exists");
    }

    _users[command.password] = User(
      firstname: command.firstname,
      lastname: command.lastname,
      email: command.email,
    );
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final User user = _users.entries
          .firstWhere((entry) => entry.key == password && entry.value.email == email)
          .value;

      _currentUser = user;
    } on StateError catch (_) {
      throw const InvalidCredentialsException("Invalid credentials");
    }
  }

  @override
  Future<User> me() async {
    if (_currentUser == null) {
      throw const InvalidCredentialsException("Invalid access token");
    }

    return _currentUser!;
  }
}
