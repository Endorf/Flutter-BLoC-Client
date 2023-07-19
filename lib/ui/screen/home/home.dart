import 'package:bloc_app/domain/creation/creation_bloc.dart';
import 'package:bloc_app/domain/creation/state.dart';
import 'package:bloc_app/domain/home/event.dart';
import 'package:bloc_app/domain/home/hote_list_bloc.dart';
import 'package:bloc_app/domain/home/state.dart';
import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/base_stateless_screen.dart';
import 'package:bloc_app/ui/screen/home/widget/note_list.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseStatelessScreenWidget {
  final double _fabVerticalPadding = 24;
  final double _fabHorizontalPadding = 8;

  const HomeScreen({super.key}) : super(title: Strings.homeTitle);

  @override
  Widget buildChildren(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<CreationBloc, CreationState>(
            bloc: BlocProvider.of<CreationBloc>(context),
            listener: (context, state) {
              if (state.isSuccessfullySubmited) {
                context.read<NoteListBloc>().add(Event());
              }
            },
          )
        ],
        child: BlocBuilder<NoteListBloc, ListState>(
          bloc: BlocProvider.of<NoteListBloc>(context),
          builder: (context, state) {
            return Stack(
              children: [
                NoteList(list: state.list),
                LinearProgressBar(isLoading: state.isLoading),
              ],
            );
          },
        ));
  }

  @override
  Widget? buildfloatingActionButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: _fabVerticalPadding,
          horizontal: _fabHorizontalPadding,
        ),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onTertiary,
          tooltip: Strings.homeTooltip,
          child: const Icon(Icons.note_alt_rounded),
          onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
        ));
  }
}
