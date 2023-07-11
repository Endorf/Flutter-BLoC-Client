import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Home screen",
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
          child: const Text('Create'),
        ),
      ],
    );
  }
}
