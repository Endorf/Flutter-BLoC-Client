import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/base_screen.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreationScreen extends BaseScreen {
  const CreationScreen({super.key}) : super(title: Strings.creationTitle);

  @override
  Widget buildChildren(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Creation screen",
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () => context.read<RouterBloc>().add(HomeEvent()),
          child: const Text('pop'),
        ),
      ],
    );
  }
}
