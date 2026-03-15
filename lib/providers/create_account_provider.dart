import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/models/create_account_model.dart';

class CreateAccountNotifier extends StateNotifier<CreateAccountState> {
  CreateAccountNotifier() : super(CreateAccountState());
  void changeRole(String? role) {
    state = state.copyWith(role: role);
  }

  void changeFaculty(String? faculty) {
    state = state.copyWith(faculty: faculty);
  }
}

final createAccountProvider =
    StateNotifierProvider<CreateAccountNotifier, CreateAccountState>((ref) {
      return CreateAccountNotifier();
    });
