
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/providers/login_state.dart';
import 'package:smart_university_app/utils/services/auth_services.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  final AuthService _authService = AuthService();

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<bool> login() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _authService.login(email: state.email, password: state.password);

      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
