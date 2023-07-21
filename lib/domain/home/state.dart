import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:bloc_app/util/%20copy.dart';

class ListState implements Copyable<ListState> {
  final List<RemoteNote>? list;
  final bool isReady;
  final bool isLoading;
  final bool isRefreshing;

  ListState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.isReady = false,
    this.list,
  });

  @override
  ListState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    bool? isReady,
    List<RemoteNote>? list,
  }) {
    return ListState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isReady: isReady ?? this.isReady,
      list: list ?? this.list,
    );
  }
}
