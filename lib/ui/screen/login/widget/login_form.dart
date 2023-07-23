import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginForm extends StatefulWidget {
  final Function(BuildContext, String) onSubmitForm;

  const LoginForm({super.key, required this.onSubmitForm});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const _loginTitlePaddingBottom = 30.0;

  static const _buttonPaddingBottom = 30.0;
  static const _buttonPaddingTop = 30.0;
  static const _buttonPaddingLeft = 4.0;
  static const _buttonPaddingRight = 4.0;

  final _formKey = GlobalKey<FormState>();
  final _emailInputController = TextEditingController();

  @override
  void dispose() {
    _emailInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: _loginTitlePaddingBottom),
              child: Text(
                Strings.loginTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              )),
          DefaultTextFormField(
            labelText: Strings.emailLabel,
            controller: _emailInputController,
            validationCallback: onValidate,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: _buttonPaddingLeft,
                top: _buttonPaddingTop,
                bottom: _buttonPaddingBottom,
                right: _buttonPaddingRight),
            child: DefaultElevationButton(
              labelText: Strings.enterTitle,
              onPressed: () => _onSubmitBtnPressed(),
            ),
          ),
        ],
      ),
    );
  }

  String? onValidate(String? value) {
    if (value == null) {
      return Strings.errrorEmptyError;
    } else {
      final trimmedString = value.trim();
      if (trimmedString.isEmpty) {
        return Strings.errrorEmptyError;
      } else if (!EmailValidator.validate(trimmedString)) {
        return Strings.errrorIncorrectError;
      }
    }
    return null;
  }

  void _onSubmitBtnPressed() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      widget.onSubmitForm(context, _emailInputController.text.trim());
    }
  }
}
