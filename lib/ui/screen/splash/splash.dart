import 'package:bloc_app/domain/initialization/initialization_bloc.dart';
import 'package:bloc_app/domain/initialization/state.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({super.key, required Null Function(dynamic index) onInitialization});

  final void Function(int) onInitialization;

  const SplashScreen({super.key, required this.onInitialization});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitializationBloc, SplashState>(
        listener: (context, state) {
          if (state.isReady) {
            if (state.isAuthenticated) {
              onInitialization(0);
            } else {
              onInitialization(1);
            }
          }
        },
        builder: (context, state) => const RootContentContainer());
  }
}
