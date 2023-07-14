import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/button.dart';
import 'package:bloc_app/ui/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static const _cardPaddingStart = 8.0;
  static const _cardPaddingTop = 20.0;
  static const _cardPaddingEnd = 8.0;
  static const _cardPaddingBottom = 30.0;

  static const _loginTitlePaddingBottom = 30.0;

  static const _buttonPaddingBottom = 30.0;
  static const _buttonPaddingTop = 30.0;
  static const _buttonPaddingLeft = 4.0;
  static const _buttonPaddingRight = 4.0;

  final _emailInputController = TextEditingController();

  @override
  void dispose() {
    _emailInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          radius: 1.1,
          colors: [
            ThemeConfig.experimentalSecondaryColor,
            ThemeConfig.experimentalPrimaryColor,
          ],
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: _cardPaddingStart, right: _cardPaddingEnd),
            child: Card(
              color: Theme.of(context).colorScheme.background,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: _cardPaddingStart,
                      top: _cardPaddingTop,
                      right: _cardPaddingEnd,
                      bottom: _cardPaddingBottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: _loginTitlePaddingBottom),
                          child: Text(
                            Strings.loginTitle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      DefaultTextField(
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
                            onPressed: () =>
                                context.read<RouterBloc>().add(HomeEvent()),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
