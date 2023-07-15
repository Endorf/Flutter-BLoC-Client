import 'package:flutter/material.dart';

class CreationScreen extends StatelessWidget {
  final void Function() onCreate;

  const CreationScreen({super.key, required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Creation screen",
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () => onCreate(),
          child: const Text('Create'),
        ),
      ],
    );
  }
}
