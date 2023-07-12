import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterBloc extends Bloc<RoutingEvent, RouteState> {
  RouterBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) {
      emit(SplashState());
    });
    on<LoginEvent>((event, emit) {
      emit(LoginState());
    });
    on<HomeEvent>((event, emit) {
      emit(HomeState());
    });
    on<CreationEvent>((event, emit) {
      emit(CreationState());
    });
  }
}
