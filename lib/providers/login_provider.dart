import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/providers/login_state.dart';
import 'package:smart_university_app/providers/user_id_provider.dart';
import 'package:smart_university_app/utils/dio_helper.dart';
import 'package:smart_university_app/utils/services/auth_services.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(LoginState());

  final AuthService _authService = AuthService();

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<bool> login() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      state = state.copyWith(error: "Please enter email and password");
      return false;
    }

    DioHelper.setToken("");
    ref.read(tokenProvider.notifier).state = null;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final data = await _authService.login(
        email: state.email,
        password: state.password,
      );

      final token = data['token'];

      if (token == null) {
        state = state.copyWith(error: "Login failed");
        return false;
      }

      DioHelper.setToken(token);
      ref.read(tokenProvider.notifier).state = token;

      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
