import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/base_screen.dart';
import 'package:bloc_app/ui/screen/home/widget/note_list.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key}) : super(title: Strings.homeTitle);

  @override
  Widget buildChildren(BuildContext context) {
    return const NoteList();
  }

  @override
  Widget? buildfloatingActionButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onTertiary,
          tooltip: Strings.homeTooltip,
          child: const Icon(Icons.note_alt_rounded),
          onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
        ));
  }
}
