class CreateAccountState {
  final String? role;
  final String? faculty;

  CreateAccountState({this.role, this.faculty});

  CreateAccountState copyWith({String? role, String? faculty}) {
    return CreateAccountState(
      role: role ?? this.role ?? "Student",
      faculty: faculty ?? this.faculty,
    );
  }
}
