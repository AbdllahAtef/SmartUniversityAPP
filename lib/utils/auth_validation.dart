/// Business logic validation for auth fields
class AuthValidation {
  /// Validates email format with comprehensive checks
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmed = email.trim();

    // Length check
    if (trimmed.length > 254) {
      return 'Email is too long';
    }

    if (trimmed.length < 5) {
      return 'Email is too short';
    }

    if (trimmed.contains(' ')) {
      return 'Email must not contain spaces';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(trimmed)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Validates password strength
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (password.length > 128) {
      return 'Password is too long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain number';
    }

    return null;
  }

  /// Pre-login validation of credentials
  static Map<String, String> validateLoginCredentials(
    String email,
    String password,
  ) {
    final errors = <String, String>{};

    final emailError = validateEmail(email);
    if (emailError != null) errors['email'] = emailError;

    // For login, we're more lenient with password validation
    if (password.isEmpty) {
      errors['password'] = 'Password is required';
    } else if (password.length < 1) {
      errors['password'] = 'Password is too short';
    }

    return errors;
  }
}
