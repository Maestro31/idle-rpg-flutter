import 'package:idle_rpg_flutter/redux/auth/actions.dart';
import 'package:idle_rpg_flutter/redux/auth/auth_state.dart';
import 'package:idle_rpg_flutter/redux/auth/models/models.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, UserCreationDoneAction>(_userCreationDone),
  TypedReducer<AuthState, StartLoadingAction>(_startLoading),
  TypedReducer<AuthState, DisconnectAction>(_disconnect),
  TypedReducer<AuthState, UserCreationFailedAction>(_userCreationFailed),
  TypedReducer<AuthState, UserLoginDoneAction>(_userLoginDone),
  TypedReducer<AuthState, UserLoginFailedAction>(_userLoginFailed),
]);

AuthState _userCreationDone(AuthState state, UserCreationDoneAction action) {
  return AuthState(
    user: action.user,
    status: AuthStatus.connected,
    errorMessage: null,
  );
}

AuthState _startLoading(AuthState state, StartLoadingAction action) {
  return state.copyWith(errorMessage: null, status: AuthStatus.fetching);
}

AuthState _disconnect(AuthState state, DisconnectAction action) {
  return AuthState.initialState().copyWith(status: AuthStatus.disconnected);
}

AuthState _userCreationFailed(AuthState state, UserCreationFailedAction action) {
  return AuthState.initialState().copyWith(
    status: AuthStatus.disconnected,
    errorMessage: action.errorMessage,
  );
}

AuthState _userLoginDone(AuthState state, UserLoginDoneAction action) {
  return AuthState(
    user: action.user,
    status: AuthStatus.connected,
    errorMessage: null,
  );
}

AuthState _userLoginFailed(AuthState state, UserLoginFailedAction action) {
  return AuthState.initialState().copyWith(
    status: AuthStatus.disconnected,
    errorMessage: action.errorMessage,
  );
}
