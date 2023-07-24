import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:bloc_app/ui/screen/home/widget/note_item.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final List<RemoteNote> list;

  const NoteList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) =>
            NoteItem(content: list[index]));
  }

  TextStyle wrapEmptyWidgetTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.error);
  }
}
