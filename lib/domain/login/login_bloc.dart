import 'package:bloc_app/data/auth_repository.dart';
import 'package:bloc_app/domain/login/event.dart';
import 'package:bloc_app/domain/login/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

class LoginBloc extends Bloc<Event, LoginState> {
  final repository = AuthRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        Result result = await repository.authenticate(event.email);

        emit(state.copyWith(isLoading: false));
        result.when((user) {
          emit(state.copyWith(isAuthenticated: true, user: user));
        }, (error) {
          emit(state.copyWith(hasError: true, message: error.toString()));
        });
      } catch (error) {
        emit(LoginState(isAuthenticated: false));
      }
    });
  }
}
