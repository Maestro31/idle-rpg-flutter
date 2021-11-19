import 'package:flutter_test/flutter_test.dart';
import 'package:idle_rpg_flutter/core/auth/commands/create_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/in_memory_user_gateway.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/create_user.dart';
import 'package:idle_rpg_flutter/dependencies.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/auth/auth_state.dart';
import 'package:idle_rpg_flutter/redux/auth/models/models.dart';
import 'package:idle_rpg_flutter/redux/configure_store.dart';
import 'package:redux/redux.dart';

void main() {
  late InMemoryUserGateway userGateway;
  late Store<AppState> store;
  late CreateUserCommand command;
  late User currentUser;

  group('CreateUser', () {
    setUp(() {
      userGateway = InMemoryUserGateway();
      store = configureStore(Dependencies(userGateway: userGateway));

      command = CreateUserCommand(
        firstname: 'Jack',
        lastname: 'Skellington',
        email: 'jack.skellington@halloween.com',
        password: 'jackh@lloween',
      );

      currentUser = User(
        firstname: 'Jack',
        lastname: 'Skellington',
        email: 'jack.skellington@halloween.com',
      );
      userGateway.shouldReturnMeWith(currentUser);
    });

    test('should call create user with given informations', () async {
      await store.dispatch(createUser(command));

      expect(userGateway.lastCreateUserCommand, equals(command));
    });

    test('should set error message when error is raised', () async {
      userGateway.shouldThrowError(Exception('Error message'));

      try {
        await store.dispatch(createUser(command));
      } catch (_) {
        expect(
          store.state.auth,
          equals(
            const AuthState(
              errorMessage: 'Error message',
              user: null,
              status: AuthStatus.disconnected,
            ),
          ),
        );
      }
    });

    test('should automatically login when user creation is successfull', () async {
      await store.dispatch(createUser(command));

      expect(userGateway.lastLoginEmail, equals(command.email));
      expect(userGateway.lastLoginPassword, equals(command.password));
      expect(
        store.state.auth,
        equals(
          AuthState(
            errorMessage: null,
            user: currentUser,
            status: AuthStatus.connected,
          ),
        ),
      );
    });
  });
}
