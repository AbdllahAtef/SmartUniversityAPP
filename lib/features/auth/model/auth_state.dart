enum AuthStatus { idle, loading, success, failure }

class AuthState {
  const AuthState({
    this.status = AuthStatus.idle,
    this.emailError,
    this.passwordError,
    this.errorMessage,
  });

  final AuthStatus status;
  final String? emailError;
  final String? passwordError;
  final String? errorMessage;

  static const Object _unset = Object();

  AuthState copyWith({
    AuthStatus? status,
    Object? emailError = _unset,
    Object? passwordError = _unset,
    Object? errorMessage = _unset,
  }) {
    return AuthState(
      status: status ?? this.status,
      emailError:
          identical(emailError, _unset) ? this.emailError : emailError as String?,
      passwordError: identical(passwordError, _unset)
          ? this.passwordError
          : passwordError as String?,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}
