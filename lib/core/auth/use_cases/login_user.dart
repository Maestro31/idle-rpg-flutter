import 'package:idle_rpg_flutter/core/auth/commands/login_user_command.dart';
import 'package:idle_rpg_flutter/core/auth/gateways/user_gateway.dart';
import 'package:idle_rpg_flutter/dependencies.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/auth/actions.dart';
import 'package:idle_rpg_flutter/redux/auth/models/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../exceptions.dart';

ThunkActionWithExtraArgument<AppState, Dependencies> loginUser(LoginUserCommand command) {
  return (Store<AppState> store, Dependencies dependencies) async {
    store.dispatch(StartLoadingAction());

    UserGateway userGateway = dependencies.userGateway!;

    try {
      await userGateway.login(command.email, command.password);
      User user = await userGateway.me();
      store.dispatch(UserLoginDoneAction(user));
    } on InvalidCredentialsException catch (e) {
      store.dispatch(UserLoginFailedAction(e.toString()));
    }
  };
}
