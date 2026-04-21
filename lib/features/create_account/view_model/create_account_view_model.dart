import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/create_account/model/create_account_model.dart';

final createAccountProvider =
    NotifierProvider<CreateAccountViewModel, CreateAccountState>(
  CreateAccountViewModel.new,
);

class CreateAccountViewModel extends Notifier<CreateAccountState> {
  @override
  CreateAccountState build() => CreateAccountState();

  void changeRole(String? role) {
    state = state.copyWith(role: role);
  }

  void changeFaculty(String? faculty) {
    state = state.copyWith(faculty: faculty);
  }
}
