import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/dropdown.dart';
import 'package:bloc_app/ui/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class CreationScreen extends StatefulWidget {
  final void Function() onCreate;

  const CreationScreen({super.key, required this.onCreate});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleInputController = TextEditingController();
  final _detailsInputController = TextEditingController();

  String selectedValue = "General";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: SingleChildScrollView(
            child: Card(
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  children: [
                    DefaultDropdownButton(
                      list: ["General", "Quote", 'Metaphor'],
                      selectedValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          if (value != null && value.isEmpty) {
                            selectedValue = value;
                          }
                        });
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: DefaultTextFormField(
                          labelText: Strings.titleNoteLabel,
                          controller: _titleInputController,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: DefaultTextFormField(
                          labelText: Strings.detailsNoteLabel,
                          controller: _detailsInputController,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: DefaultElevationButton(
                          labelText: Strings.submitNoteLabel,
                          onPressed: () => {
                            if (_formKey.currentState!.validate())
                              widget.onCreate()
                          },
                        )),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
