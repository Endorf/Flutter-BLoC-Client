import 'package:bloc_app/data/repository/fake_repository.dart';
import 'package:bloc_app/domain/initialization/event.dart';
import 'package:bloc_app/domain/initialization/state.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitializationBloc extends Bloc<Event, SplashState> {
  final _repository = locator<FakeRepository>();

  InitializationBloc() : super(SplashState()) {
    on<Event>((event, emit) async {
      emit(SplashState(isLoading: true));

      try {
        bool isAuthenticated = await _repository.authenticate();

        emit(SplashState(isReady: true, isAuthenticated: isAuthenticated));
      } catch (error) {
        emit(SplashState(isReady: true));
      }
    });
  }
}
