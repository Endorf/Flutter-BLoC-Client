import 'package:bloc_app/ui/screen/home/widget/note_item.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final double _avatarRadius = 52.0;
  final List<String> list;

  const NoteList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) =>
                NoteItem(content: list[index]),
          )
        : Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: _avatarRadius,
                child: Icon(
                  Icons.icecream_outlined,
                  color: Colors.white,
                  size: _avatarRadius,
                  semanticLabel: Strings.homeEmptyListSemanticLabel,
                ),
              ),
              Text(
                Strings.homeEmptyListLabel,
                style: wrapEmptyWidgetTextTheme(context),
              )
            ],
          ));
  }

  TextStyle wrapEmptyWidgetTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.error);
  }
}
