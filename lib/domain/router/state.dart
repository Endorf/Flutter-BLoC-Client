abstract class RouteState {}

abstract class HomeContext {}

abstract class CreationContext implements HomeContext {}

class SplashState extends RouteState {}

class LoginState extends RouteState {}

class HomeState extends RouteState implements HomeContext {}

class CreationState extends RouteState implements CreationContext {}
