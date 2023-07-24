import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/dropdown.dart';
import 'package:bloc_app/ui/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class CreationForm extends StatefulWidget {
  final Function(BuildContext, String, String, String) onSubmitForm;

  const CreationForm({super.key, required this.onSubmitForm});

  @override
  State<StatefulWidget> createState() => _CreationFormState();
}

class _CreationFormState extends State<CreationForm> {
  static const double _elevationButtonPadding = 12;
  static const double _textFormPadding = 8;
  static const List<String> dropDownTags = ["General", "Quote", 'Metaphor'];

  final _formKey = GlobalKey<FormState>();
  final _titleInputController = TextEditingController();
  final _detailsInputController = TextEditingController();

  String tag = dropDownTags.first;

  @override
  void dispose() {
    _titleInputController.dispose();
    _detailsInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                DefaultDropdownButton(
                  list: dropDownTags,
                  selectedValue: tag,
                  onChanged: (value) {
                    setState(() {
                      if (value != null && value.isEmpty) {
                        tag = value;
                      }
                    });
                  },
                ),
                Padding(
                    padding: const EdgeInsets.all(_textFormPadding),
                    child: DefaultTextFormField(
                      labelText: Strings.titleNoteLabel,
                      controller: _titleInputController,
                      validationCallback: onTitleValidate,
                    )),
                Padding(
                    padding: const EdgeInsets.all(_textFormPadding),
                    child: DefaultTextFormField(
                      labelText: Strings.detailsNoteLabel,
                      controller: _detailsInputController,
                    )),
                Padding(
                  padding: const EdgeInsets.all(_elevationButtonPadding),
                  child: DefaultElevationButton(
                    labelText: Strings.submitNoteLabel,
                    onPressed: () => _onSubmitBtnPressed(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? onTitleValidate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.creationTitlerEmptyError;
    } else {
      return null;
    }
  }

  void _onSubmitBtnPressed() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      widget.onSubmitForm(
        context,
        tag,
        _titleInputController.text.trim(),
        _detailsInputController.text.trim(),
      );
    }
  }
}
