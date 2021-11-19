import 'package:idle_rpg_flutter/redux/auth/auth_state.dart';

class AppState {
  final AuthState auth;

  const AppState({required this.auth});

  AppState.initialState() : auth = AuthState.initialState();

  AppState copyWith({
    AuthState? auth,
  }) {
    return AppState(
      auth: auth ?? this.auth,
    );
  }
}
