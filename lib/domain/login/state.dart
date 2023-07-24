import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:bloc_app/util/copy.dart';

class LoginState implements Copyable<LoginState> {
  final bool isAuthenticated;
  final RemoteUser? user;
  final bool isLoading;
  final bool hasError;
  final String? message;

  LoginState({
    this.isAuthenticated = false,
    this.user,
    this.isLoading = false,
    this.hasError = false,
    this.message,
  });

  @override
  LoginState copyWith({
    bool? isAuthenticated,
    RemoteUser? user,
    bool? isLoading,
    bool? hasError,
    String? message,
  }) {
    return LoginState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError,
        message: message ?? this.message);
  }
}
