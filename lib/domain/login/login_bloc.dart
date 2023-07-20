import 'package:bloc_app/data/fake_repository.dart';
import 'package:bloc_app/domain/login/event.dart';
import 'package:bloc_app/domain/login/state.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<Event, LoginState> {
  final repository = FakeRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginState(isLoading: true));

      try {
        bool isAuthenticated = await repository.authenticate();

        emit(LoginState(
          isAuthenticated: isAuthenticated,
          hasError: !isAuthenticated,
          message: Strings.defaultErrorMessage,
        ));
      } catch (error) {
        emit(LoginState(isAuthenticated: false));
      }
    });
  }
}
