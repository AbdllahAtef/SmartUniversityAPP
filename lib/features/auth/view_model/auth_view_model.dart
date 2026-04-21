import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/model/auth_state.dart';
import 'package:smart_university_app/features/auth/model/sign_in_credentials.dart';

final authViewModelProvider =
    NotifierProvider<AuthViewModel, AuthState>(AuthViewModel.new);

class AuthViewModel extends Notifier<AuthState> {
  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  AuthState build() => const AuthState();

  void resetAfterNavigation() {
    state = const AuthState();
  }

  void clearEmailError() {
    if (state.emailError != null) {
      state = state.copyWith(emailError: null);
    }
  }

  void clearPasswordError() {
    if (state.passwordError != null) {
      state = state.copyWith(passwordError: null);
    }
  }

  String? _validateEmail(String email) {
    final trimmed = email.trim();
    if (trimmed.isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailPattern.hasMatch(trimmed)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Validates credentials and performs sign-in (mock API).
  Future<void> signInWithEmail(String email, String password) =>
      signInWithCredentials(SignInCredentials(email: email, password: password));

  Future<void> signInWithCredentials(SignInCredentials credentials) async {
    final emailErr = _validateEmail(credentials.email);
    final passErr = _validatePassword(credentials.password);
    if (emailErr != null || passErr != null) {
      state = state.copyWith(
        emailError: emailErr,
        passwordError: passErr,
        status: AuthStatus.idle,
        errorMessage: null,
      );
      return;
    }

    state = state.copyWith(
      emailError: null,
      passwordError: null,
      errorMessage: null,
      status: AuthStatus.loading,
    );

    try {
      await Future<void>.delayed(const Duration(milliseconds: 650));
      state = state.copyWith(status: AuthStatus.success);
    } catch (_) {
      state = state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Something went wrong. Please try again.',
      );
    }
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      emailError: null,
      passwordError: null,
      status: AuthStatus.failure,
      errorMessage: 'Google sign-in is not available yet.',
    );
  }

  Future<void> signInWithFacebook() async {
    state = state.copyWith(
      emailError: null,
      passwordError: null,
      status: AuthStatus.failure,
      errorMessage: 'Facebook sign-in is not available yet.',
    );
  }

  void clearTransientMessage() {
    if (state.errorMessage != null) {
      state = state.copyWith(status: AuthStatus.idle, errorMessage: null);
    }
  }
}
