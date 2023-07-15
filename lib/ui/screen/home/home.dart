import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Shell')),
      body: Center(
        child: child,
      ),
    );
  }

  int _getSelectedIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/creation')) return 1;
    return 0;
  }
}
