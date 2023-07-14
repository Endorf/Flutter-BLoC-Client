import 'package:bloc_app/ui/widget/app_container.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {
  final String title;

  const BaseScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: add hide/show animation.
      appBar: _isAppBarVisible ? AppBar(title: Text(title)) : null,
      body: AppContainer(child: buildChildren(context)),
    );
  }

  bool get _isAppBarVisible => true;

  Widget buildChildren(BuildContext context);
}
