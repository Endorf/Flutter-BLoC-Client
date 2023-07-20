import 'package:bloc_app/domain/login/login_bloc.dart';
import 'package:bloc_app/domain/login/state.dart';
import 'package:bloc_app/domain/login/event.dart' as auth;
import 'package:bloc_app/domain/router/event.dart' as router;
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const _cardPaddingStart = 8.0;
  static const _cardPaddingTop = 20.0;
  static const _cardPaddingEnd = 8.0;
  static const _cardPaddingBottom = 30.0;

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
    return Scaffold(
      body: RootContentContainer(
        child: _buildChild(context),
      ),
    );
  }

  Widget _buildChild(BuildContext mainContext) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isAuthenticated) {
        context.read<RouterBloc>().add(router.HomeEvent());
      } else if (state.hasError) {
        final String message = state.message != null
            ? state.message!
            : Strings.defaultErrorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }, builder: (context, state) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(
              left: _cardPaddingStart, right: _cardPaddingEnd),
          child: SingleChildScrollView(
            primary: false,
            scrollDirection: Axis.vertical,
            child: Card(
              color: Theme.of(context).colorScheme.background,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: _cardPaddingStart,
                    top: _cardPaddingTop,
                    right: _cardPaddingEnd,
                    bottom: _cardPaddingBottom,
                  ),
                  child: _buildForm(context, state),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildForm(BuildContext context, LoginState state) {
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

  void _onSubmitBtnPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      context
          .read<LoginBloc>()
          .add(auth.LoginEvent(email: _emailInputController.text));
    }
  }
}
