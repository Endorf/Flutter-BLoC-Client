import 'package:bloc_app/domain/login/login_bloc.dart';
import 'package:bloc_app/domain/login/state.dart';
import 'package:bloc_app/domain/login/event.dart' as auth;
import 'package:bloc_app/domain/router/event.dart' as router;
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/login/widget/login_form.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const _cardPaddingStart = 8.0;
  static const _cardPaddingTop = 20.0;
  static const _cardPaddingEnd = 8.0;
  static const _cardPaddingBottom = 30.0;

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RootContentContainer(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: _onBlocEventListener,
          builder: _widgetBuilder,
        ),
      ),
    );
  }

  _onBlocEventListener(BuildContext context, LoginState state) {
    if (state.isAuthenticated) {
      context.read<RouterBloc>().add(router.HomeEvent());
    } else if (state.hasError) {
      final String message =
          state.message != null ? state.message! : Strings.defaultErrorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Widget _widgetBuilder(BuildContext context, LoginState state) {
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
                  child: AbsorbPointer(
                    absorbing: state.isLoading,
                    child: LoginForm(onSubmitForm: _onSubmitForm),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  _onSubmitForm(BuildContext context, String email) {
    context.read<LoginBloc>().add(auth.LoginEvent(email: email));
  }
}
