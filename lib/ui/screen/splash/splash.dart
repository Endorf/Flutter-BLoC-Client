import 'package:bloc_app/domain/initialization/initialization_bloc.dart';
import 'package:bloc_app/domain/initialization/state.dart';
import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitializationBloc, SplashState>(
        listener: (context, state) {
          if (state.isReady) {
            final router = context.read<RouterBloc>();

            if (state.isAuthenticated) {
              router.add(HomeEvent());
            } else {
              router.add(LoginEvent());
            }
          }
        },
        builder: (context, state) => Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(
              radius: 1.2,
              colors: [
                ThemeConfig.experimentalSecondaryColor,
                ThemeConfig.experimentalPrimaryColor,
              ],
            )),
            child: const Stack()));
  }
}
