/// Represents the result of a login attempt with detailed error categorization
class LoginResult {
  final bool success;
  final String? message;
  final LoginErrorType? errorType;
  final bool shouldRetry;

  LoginResult({
    required this.success,
    this.message,
    this.errorType,
    this.shouldRetry = false,
  });

  factory LoginResult.success() => LoginResult(success: true);

  factory LoginResult.error(
    String message, {
    LoginErrorType? errorType,
    bool shouldRetry = false,
  }) => LoginResult(
    success: false,
    message: message,
    errorType: errorType,
    shouldRetry: shouldRetry,
  );
}

/// Categorizes different types of login failures
enum LoginErrorType {
  /// Invalid email format or missing credentials
  validationError,

  /// Email not registered or user not found
  userNotFound,

  /// Password is incorrect
  invalidPassword,

  /// Too many login attempts - account temporarily locked
  tooManyAttempts,

  /// User account is disabled or not activated
  accountInactive,

  /// Network connectivity issues
  networkError,

  /// Server is unreachable or having issues
  serverError,

  /// Unexpected error
  unknown,
}
