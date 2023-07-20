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
  final bool isRefreshing;

  ListState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.isReady = false,
  });
}
