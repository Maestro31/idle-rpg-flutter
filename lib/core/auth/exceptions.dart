class UserCreationException implements Exception {
  final String msg;

  const UserCreationException(this.msg);

  @override
  String toString() => 'UserCreationException: $msg';
}

class InvalidCredentialsException implements Exception {
  final String msg;

  const InvalidCredentialsException(this.msg);

  @override
  String toString() => 'InvalidCredentialsException: $msg';
}
