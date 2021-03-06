import 'package:enum_to_string/enum_to_string.dart';
import 'package:idle_rpg_flutter/redux/auth/models/models.dart';
import 'package:flutter/material.dart';

class AuthState {
  final User? user;
  final AuthStatus status;
  final String? errorMessage;

  const AuthState({this.user, this.status = AuthStatus.idle, this.errorMessage});

  AuthState.initialState()
      : user = null,
        status = AuthStatus.idle,
        errorMessage = null;

  AuthState.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        status = json['status'] != null
            ? EnumToString.fromString(AuthStatus.values, json['status'])!
            : AuthStatus.idle,
        errorMessage = json['errorMessage'];

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'status': EnumToString.convertToString(status),
        'errorMessage': errorMessage,
      };

  AuthState copyWith({
    User? user,
    AuthStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  int get hashCode => hashValues(user, status, errorMessage);

  @override
  bool operator ==(Object other) {
    return other is AuthState &&
        other.user == user &&
        other.status == status &&
        other.errorMessage == errorMessage;
  }
}
