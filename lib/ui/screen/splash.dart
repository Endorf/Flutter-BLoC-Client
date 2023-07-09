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
    final router = context.read<RouterBloc>();
    return BlocConsumer<InitializationBloc, SplashState>(
        listener: (context, state) {
          if (state.isReady) {
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
                ThemeConfig.experimentalAccentColor,
                ThemeConfig.experimentalPrimaryColor,
              ],
            )),
            child: const Stack()));
  }
}
