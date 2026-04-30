import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/faculty_model.dart';
import 'package:smart_university_app/providers/create_account_state.dart';
import 'package:smart_university_app/utils/services/auth_services.dart';

class CreateAccountNotifier extends StateNotifier<CreateAccountState> {
  CreateAccountNotifier() : super(CreateAccountState());

  final AuthService _authService = AuthService();

  void changeRole(String? role) {
    state = state.copyWith(role: role);
  }

  void changeFaculty(Faculty? faculty) {
    state = state.copyWith(faculty: faculty);
  }

  Future<bool> register() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _authService.register(
        fullName: state.fullName,
        email: state.email,
        password: state.password,
        nationalId: state.nationalId,
        role: state.role!,
        facultyId: state.faculty?.id ?? 0,
      );

      return true;
    } on DioException catch (e) {
      state = state.copyWith(error: e.response?.data.toString() ?? e.message);

      return false;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String?> submit(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return null;

    if (state.role == "Student" && state.faculty == null) {
      return "Please select a faculty";
    }

    final success = await register();

    if (success) {
      resetForm();
      return "success";
    } else {
      return state.error ?? "Error occurred";
    }
  }

  void updateName(String name) {
    state = state.copyWith(fullName: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateNationalId(String id) {
    state = state.copyWith(nationalId: id);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void resetForm() {
    state = CreateAccountState();
  }
}

final createAccountProvider =
    StateNotifierProvider<CreateAccountNotifier, CreateAccountState>((ref) {
      return CreateAccountNotifier();
    });

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final facultiesProvider = FutureProvider<List<Faculty>>((ref) async {
  final data = await AuthService().getFaculties();

  if (data.isEmpty) {
    return [];
  }

  return data
      .where((e) => e is Map<String, dynamic>)
      .map<Faculty>((e) => Faculty.fromJson(e))
      .toList();
});
