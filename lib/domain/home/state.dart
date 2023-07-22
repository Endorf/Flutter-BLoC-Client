import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:bloc_app/util/%20copy.dart';

class ListState implements Copyable<ListState> {
  final List<RemoteNote>? list;
  final bool isLoading;
  final bool isRefreshing;

  ListState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.list,
  });

  @override
  ListState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    List<RemoteNote>? list,
  }) {
    return ListState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      list: list ?? this.list,
    );
  }
}
