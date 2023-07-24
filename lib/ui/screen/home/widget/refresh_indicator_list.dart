import 'dart:async';

import 'package:bloc_app/domain/creation/creation_bloc.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:bloc_app/domain/home/event.dart';
import 'package:bloc_app/domain/home/hote_list_bloc.dart';
import 'package:bloc_app/domain/home/state.dart';
import 'package:bloc_app/ui/screen/home/widget/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshIndicatorList extends StatefulWidget {
  const RefreshIndicatorList({super.key});

  @override
  State<StatefulWidget> createState() => _RefreshIndicatorListState();
}

class _RefreshIndicatorListState extends State<RefreshIndicatorList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // TODO: Investigate how to avoid Completer hot fix.
  // TODO: Investigate bug. RefreshIndicator couldn't show infinitely indicator according to docs
  Completer completer = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<CreationBloc, CreationState>(
            bloc: BlocProvider.of<CreationBloc>(context),
            listener: (context, state) {
              if (state.isSuccessfullySubmited) {
                context.read<NoteListBloc>().add(LoadEvent());
              }
            },
          ),
          BlocListener<NoteListBloc, ListState>(
            bloc: BlocProvider.of<NoteListBloc>(context),
            listener: (context, state) {
              if (!state.isRefreshing && !completer.isCompleted) {
                completer.complete();
              }
            },
          )
        ],
        child: BlocBuilder<NoteListBloc, ListState>(
          bloc: BlocProvider.of<NoteListBloc>(context)..add(LoadEvent()),
          builder: (context, state) {
            return _buildList(context, state);
          },
        ));
  }

  Widget _buildList(BuildContext context, ListState state) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        // RefreshIndicator couldn't show infinitely indicator according to docs
        context.read<NoteListBloc>().add(RefreshEvent());
        setState(() {
          if (completer.isCompleted) completer = Completer<void>();
        });
        return completer.future;
      },
      child: NoteList(list: state.list ?? []),
    );
  }
}
