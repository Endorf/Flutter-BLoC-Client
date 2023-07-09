class RouterState1 {
  final bool isLoading;
  final bool isReady;
  final bool isAuthenticated;

  RouterState1({
    this.isLoading = false,
    this.isReady = false,
    this.isAuthenticated = false,
  });
}

abstract class RouterState {}

class SplashState implements RouterState {}

class LoginState implements RouterState {}

class HomeState implements RouterState {}
