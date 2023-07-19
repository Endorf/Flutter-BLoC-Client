import 'package:bloc_app/data/fake_repository.dart';
import 'package:bloc_app/domain/creation/event.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationBloc extends Bloc<Event, CreationState> {
  // TODO: use DI
  final repository = FakeRepository();

  CreationBloc() : super(CreationState()) {
    on<SubmitEvent>((event, emit) async {
      emit(CreationState(isLoading: true));

      try {
        bool isAuthenticated = await repository.authenticate();

        emit(CreationState(isSuccessfullySubmited: isAuthenticated));
      } catch (error) {
        emit(CreationState(isSuccessfullySubmited: false, message: "error"));
      }
    });
  }
}
