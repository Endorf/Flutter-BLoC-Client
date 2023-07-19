class ListState {
  final List<String> list = [
    "1 test",
    "2 test",
    "3 test",
    "4 test",
    "5 test",
    "6 test",
    "7",
    "9 test"
  ];
  final bool isReady;
  final bool isLoading;

  ListState({
    this.isLoading = false,
    this.isReady = false,
  });
}
