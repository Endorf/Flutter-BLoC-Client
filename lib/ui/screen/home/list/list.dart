import 'package:bloc_app/ui/screen/home/widget/note_list.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const ListPage({super.key});

  final void Function() onNewNote;

  const HomeScreen({super.key, required this.onNewNote});
  // const ListPage() : super(Pages.home, const ValueKey('home'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildfloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: const RootContentContainer(child: NoteList()),
    );
  }

  Widget _buildfloatingActionButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onTertiary,
          tooltip: Strings.homeTooltip,
          child: const Icon(Icons.note_alt_rounded),
          onPressed: () => {onNewNote()},
        ));
  }
}
