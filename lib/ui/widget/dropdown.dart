import 'package:flutter/material.dart';

class DefaultDropdownButton extends StatelessWidget {
  final List<String> list;
  final String selectedValue;
  final void Function(String? value) onChanged;

  static const _padding = 12.0;

  const DefaultDropdownButton({
    super.key,
    required this.list,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focusedBorder = theme.colorScheme.primary;
    final enabledBorder = theme.colorScheme.onSurfaceVariant;

    return DropdownButtonFormField<String>(
      padding: const EdgeInsets.all(_padding),
      value: selectedValue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorder),
        ),
      ),
      onChanged: (String? value) => onChanged(value),
      selectedItemBuilder: (BuildContext context) {
        return list.map<Widget>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList();
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }).toList(),
    );
  }
}
