import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  static const _paddings = 4.0;

  final String labelText;
  final TextEditingController? controller;

  const DefaultTextFormField(
      {super.key, required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorBorder = theme.colorScheme.error;
    final focusedBorder = theme.colorScheme.primary;
    final enabledBorder = theme.colorScheme.onSurfaceVariant;

    return Padding(
        padding: const EdgeInsets.all(_paddings),
        child: TextFormField(
          autocorrect: false,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: enabledBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorder),
            ),
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
