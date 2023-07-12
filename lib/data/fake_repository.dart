import 'dart:async';

class FakeRepository {
  Future<bool> authenticate() {
    return Future.delayed(
        const Duration(seconds: 1), () => Future(() => false));
  }
}
