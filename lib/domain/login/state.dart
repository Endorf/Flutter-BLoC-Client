class LoginState {
  final bool isAuthenticated;
  final bool isLoading;
  final bool hasError;
  final String? message;

  LoginState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.hasError = false,
    this.message,
  });
}
