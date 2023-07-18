import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';

// TODO: refactor screens transitions;
// Temporary solution to avoid creation of BLoC
abstract class BaseStatefullScreenWidget extends StatefulWidget {
  final String title;

  const BaseStatefullScreenWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: add hide/show animation.
      appBar: _isAppBarVisible
          ? AppBar(centerTitle: true, title: Text(title))
          : null,
      floatingActionButton: buildfloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: RootContentContainer(child: buildChildren(context)),
    );
  }

  bool get _isAppBarVisible => true;

  Widget buildChildren(BuildContext context);

  Widget? buildfloatingActionButton(BuildContext context) => null;
}
