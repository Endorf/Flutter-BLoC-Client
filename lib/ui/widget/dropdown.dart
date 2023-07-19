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
    final borderSide = BorderSide(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return DropdownButtonFormField<String>(
      padding: const EdgeInsets.all(_padding),
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: borderSide),
        focusedBorder: OutlineInputBorder(borderSide: borderSide),
        enabledBorder: OutlineInputBorder(borderSide: borderSide),
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
