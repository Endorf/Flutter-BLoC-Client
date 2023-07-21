import 'package:bloc_app/data/repository/fake_repository.dart';
import 'package:bloc_app/domain/home/event.dart';
import 'package:bloc_app/domain/home/state.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteListBloc extends Bloc<Event, ListState> {
  final _repository = locator<FakeRepository>();

  NoteListBloc() : super(ListState()) {
    on<LoadEvent>((event, emit) async {
      emit(ListState(isLoading: true));

      try {
        await _repository.authenticate();

        emit(ListState(isReady: true));
      } catch (error) {
        emit(ListState(isReady: true));
      }
    });
    on<RefreshEvent>((event, emit) async {
      emit(ListState(isRefreshing: true));

      try {
        await _repository.authenticate();

        emit(ListState(isReady: true));
      } catch (error) {
        emit(ListState(isReady: true));
      }
    });
  }
}
