import 'package:flutter/material.dart';

abstract class BasePage extends Page {
  static const duration = 200;
  const BasePage(String name) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return screen;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return provideTransition(animation, child);
      },
      transitionDuration: const Duration(milliseconds: duration),
    );
  }

  Widget provideTransition(Animation<double> animation, Widget child) {
    final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
    final curveTween = CurveTween(curve: Curves.easeInOut);
    return SlideTransition(
      position: animation.drive(curveTween).drive(tween),
      child: screen,
    );
  }

  Widget get screen;
}
