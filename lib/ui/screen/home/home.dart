import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.child,
    required this.onFabClick,
  });

  final Widget child;
  final void Function() onFabClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Shell')),
      floatingActionButton: _buildfloatingActionButton(context),
      body: RootContentContainer(child: child),
    );
  }

  Widget? _buildfloatingActionButton(BuildContext context) {
    return GoRouter.of(context).routeInformationProvider.value.location !=
            "/home/creation"
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.onTertiary,
              tooltip: Strings.homeTooltip,
              child: const Icon(Icons.note_alt_rounded),
              onPressed: () => {onFabClick()},
            ))
        : null;
  }
}
