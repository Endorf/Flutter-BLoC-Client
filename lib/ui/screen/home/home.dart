import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/ui/screen/base_stateless_screen.dart';
import 'package:bloc_app/ui/screen/home/widget/refresh_indicator_list.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseStatelessScreenWidget {
  static const double _fabVerticalPadding = 24;
  static const double _fabHorizontalPadding = 8;

  const HomeScreen({super.key}) : super(title: Strings.homeTitle);

  @override
  Widget buildChildren(BuildContext context) {
    return const RefreshIndicatorList();
  }

  @override
  Widget? buildfloatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: _fabVerticalPadding,
        horizontal: _fabHorizontalPadding,
      ),
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onTertiary,
        tooltip: Strings.homeTooltip,
        child: const Icon(Icons.note_alt_rounded),
        onPressed: () => context.read<RouterBloc>().add(CreationEvent()),
      ),
    );
  }
}
