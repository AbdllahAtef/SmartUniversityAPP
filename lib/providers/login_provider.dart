import 'package:dio/dio.dart';
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
  if (state.email.isEmpty || state.password.isEmpty) {
    state = state.copyWith(error: "Please enter email and password");
    return false;
  }

  state = state.copyWith(isLoading: true, clearError: true);

  try {
    final response = await _authService.login(
      email: state.email,
      password: state.password,
    );

    if (response.statusCode == 200) {
      return true;
    }

    state = state.copyWith(error: "Login failed");
    return false;

  } on DioException catch (e) {
    String message;

    if (e.response != null) {
      final data = e.response?.data;

      if (data is String && data.trim().isNotEmpty) {
        message = data;
      } else {
        message = "Something went wrong";
      }
    } else {
      message = "No internet connection";
    }

    state = state.copyWith(error: message);
    return false;

  } catch (e) {
    state = state.copyWith(error: e.toString());
    return false;

  } finally {
    state = state.copyWith(isLoading: false);
  }
}
}
