import 'package:idle_rpg_flutter/redux/auth/models/auth_status.dart';

bool isAuthenticatedSelector(state) => state.auth.status == AuthStatus.connected;
