import 'package:bloc_app/data/fake_repository.dart';
import 'package:bloc_app/domain/initialization/event.dart';
import 'package:bloc_app/domain/initialization/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitializationBloc extends Bloc<Event, SplashState> {
  // TODO: use DI
  final repository = FakeRepository();

  InitializationBloc() : super(SplashState()) {
    on<Event>((event, emit) async {
      emit(SplashState(isLoading: true));

      try {
        bool isAuthenticated = await repository.authenticate();

        emit(SplashState(isReady: true, isAuthenticated: isAuthenticated));
      } catch (error) {
        emit(SplashState(isReady: true));
      }
    });
  }
}
