import 'package:idle_rpg_flutter/redux/auth/models/user.dart';

class UserCreationDoneAction {
  final User user;
  const UserCreationDoneAction(this.user);
}

class StartLoadingAction {}

class DisconnectAction {}

class UserCreationFailedAction {
  final String errorMessage;
  const UserCreationFailedAction(this.errorMessage);
}

class UserLoginDoneAction {
  final User user;
  const UserLoginDoneAction(this.user);
}

class UserLoginFailedAction {
  final String errorMessage;
  const UserLoginFailedAction(this.errorMessage);
}
