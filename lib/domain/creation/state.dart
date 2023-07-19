class CreationState {
  final bool isLoading;
  final bool isSuccessfullySubmited;
  final bool hasError;
  final String? message;

  CreationState({
    this.isLoading = false,
    this.isSuccessfullySubmited = false,
    this.hasError = false,
    this.message,
  });
}
