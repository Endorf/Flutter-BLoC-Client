import 'package:bloc_app/data/auth_repository.dart';
import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:bloc_app/domain/login/event.dart';
import 'package:bloc_app/domain/login/state.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<Event, LoginState> {
  final repository = AuthRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginState(isLoading: true));

      try {
        RemoteUser remoteUser = await repository.authenticate(event.email);
        bool isAuthenticated = true;

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
