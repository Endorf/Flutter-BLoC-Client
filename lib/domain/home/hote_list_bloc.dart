import 'package:bloc_app/data/repository/notes_repository.dart';
import 'package:bloc_app/domain/home/event.dart';
import 'package:bloc_app/domain/home/state.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';

class NoteListBloc extends Bloc<Event, ListState> {
  final _repository = locator<NoteRepository>();

  NoteListBloc() : super(ListState()) {
    on<LoadEvent>((event, emit) async {
      emit(ListState(isLoading: true));

      try {
        Result result = await _repository.notes();

        emit(state.copyWith(isLoading: false));
        result.when((notes) {
          emit(state.copyWith(isReady: true, list: notes));
        }, (error) {
          emit(state.copyWith(isReady: true));
        });

        emit(ListState(isReady: true));
      } catch (error) {
        emit(ListState(isReady: true));
      }
    });
    on<RefreshEvent>((event, emit) async {
      emit(ListState(isRefreshing: true));

      try {
        Result result = await _repository.notes();

        emit(state.copyWith(isLoading: false));
        result.when((notes) {
          emit(state.copyWith(isReady: true, list: notes));
        }, (error) {
          emit(state.copyWith(isReady: true));
        });

        emit(ListState(isReady: true));
      } catch (error) {
        emit(ListState(isReady: true));
      }
    });
  }
}
