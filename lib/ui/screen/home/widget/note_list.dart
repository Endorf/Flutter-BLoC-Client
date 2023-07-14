import 'package:bloc_app/ui/screen/home/widget/note_item.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<String> notes = [
    "1 test",
    "2 test",
    "3 test",
    "4 test",
    "5 test",
    "6 test",
    "7",
    "9 test"
  ];

  @override
  Widget build(BuildContext context) {
    return notes.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) =>
                NoteItem(content: notes[index]),
          )
        : const Center(child: Text('No items'));
  }
}
