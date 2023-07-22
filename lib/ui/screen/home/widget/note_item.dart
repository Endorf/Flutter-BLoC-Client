import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final RemoteNote content;

  const NoteItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              child: Icon(
                Icons.icecream_outlined,
                color: Colors.white,
                size: 24.0,
                semanticLabel: 'Text description',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(children: [
                        Text(
                          "User",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                              child: Text(
                                "tag",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      content.title,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      content.body,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
