class CreateAssignmentState {
  final bool isLoading;
  final String? error;

  const CreateAssignmentState({this.isLoading = false, this.error});

  CreateAssignmentState copyWith({bool? isLoading, String? error}) {
    return CreateAssignmentState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
