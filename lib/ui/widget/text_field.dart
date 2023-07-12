import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  static const _paddings = 4.0;

  final String labelText;
  final TextEditingController? controller;

  const DefaultTextField({super.key, required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focusedBorder = theme.colorScheme.primary;
    final enabledBorder = theme.colorScheme.onSurfaceVariant;

    return Padding(
        padding: const EdgeInsets.all(_paddings),
        child: TextField(
          obscureText: false,
          style: Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: enabledBorder),
            ),
          ),
        ));
  }
}
