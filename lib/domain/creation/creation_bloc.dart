import 'package:bloc_app/data/repository/fake_repository.dart';
import 'package:bloc_app/domain/creation/event.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationBloc extends Bloc<Event, CreationState> {
  final _repository = locator<FakeRepository>();

  CreationBloc() : super(CreationState()) {
    on<SubmitEvent>((event, emit) async {
      emit(CreationState(isLoading: true));

      try {
        bool isAuthenticated = await _repository.authenticate();

        emit(CreationState(
          isSuccessfullySubmited: isAuthenticated,
          hasError: !isAuthenticated,
          message: "error",
        ));
      } catch (error) {
        emit(CreationState(isSuccessfullySubmited: false, message: "error"));
      }
    });
  }
}
