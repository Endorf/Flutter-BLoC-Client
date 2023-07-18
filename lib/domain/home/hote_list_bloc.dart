import 'package:bloc_app/data/fake_repository.dart';
import 'package:bloc_app/domain/home/event.dart';
import 'package:bloc_app/domain/home/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteListBloc extends Bloc<Event, ListState> {
  final repository = FakeRepository();

  NoteListBloc() : super(ListState()) {
    on<Event>((event, emit) async {
      emit(ListState(isLoading: true));

      try {
        await repository.authenticate();

        emit(ListState(isReady: true));
      } catch (error) {
        emit(ListState(isReady: true));
      }
    });
  }
}
