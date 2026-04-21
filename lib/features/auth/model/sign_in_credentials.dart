/// Email/password pair used for email sign-in (kept separate from UI state).
class SignInCredentials {
  const SignInCredentials({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
