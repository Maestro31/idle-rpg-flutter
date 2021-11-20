import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:idle_rpg_flutter/core/auth/commands/login_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/exceptions.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/in_memory_user_gateway.dart';
import 'package:idle_rpg_flutter/core/auth/use_cases/login_user.dart';
import 'package:idle_rpg_flutter/dependencies.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/auth/auth_state.dart';
import 'package:idle_rpg_flutter/redux/auth/models/models.dart';
import 'package:idle_rpg_flutter/redux/configure_store.dart';
import 'package:redux/redux.dart';

void main() {
  group("Login User", () {
    late InMemoryUserGateway userGateway;
    late Store<AppState> store;
    late LoginUserCommand command;
    late User currentUser;

    setUp(() {
      userGateway = InMemoryUserGateway();
      store = configureStore(Dependencies(userGateway: userGateway));

      command = LoginUserCommand(
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

    test("should stay disconnected when invalid credentials is raised", () async {
      userGateway.shouldThrowError(const InvalidCredentialsException("Error message"));

      await store.dispatch(loginUser(command));

      expect(
        store.state.auth,
        equals(
          const AuthState(
            errorMessage: "InvalidCredentialsException: Error message",
            user: null,
            status: AuthStatus.disconnected,
          ),
        ),
      );
    });

    test("should set current user when credentials are valid and be connected", () async {
      userGateway.shouldReturnMeWith(currentUser);

      await store.dispatch(loginUser(command));

      expect(
        store.state.auth,
        equals(
          AuthState(
            errorMessage: null,
            status: AuthStatus.connected,
            user: currentUser,
          ),
        ),
      );
    });
  });
}
