import 'package:flutter/material.dart';

class DefaultElevationButton extends StatelessWidget {
  static const _paddings = 16.0;

  final String labelText;
  final VoidCallback onPressed;

  const DefaultElevationButton(
      {super.key, required this.labelText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () => onPressed(),
            child: Padding(
              padding: const EdgeInsets.all(_paddings),
              child: Text(labelText),
            )));
  }
}
