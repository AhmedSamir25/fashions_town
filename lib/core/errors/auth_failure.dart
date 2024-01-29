class AuthError extends Error {
  final String code;

  AuthError(this.code);
}

class UserNotFoundAuthError extends AuthError {
  UserNotFoundAuthError() : super('user-not-found');
}

class WrongPasswordAuthError extends AuthError {
  WrongPasswordAuthError() : super('wrong-password');
}
