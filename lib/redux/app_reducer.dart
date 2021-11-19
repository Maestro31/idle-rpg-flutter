import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/auth/auth_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(auth: authReducer(state.auth, action));
}
