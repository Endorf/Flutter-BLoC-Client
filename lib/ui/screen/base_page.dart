import 'package:flutter/material.dart';

abstract class BasePage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SlideTransition(
          position: provideAnimation(animation, animation2),
          child: screen,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Animation<Offset> provideAnimation(
    Animation<double> animation,
    Animation<double> animation2,
  ) {
    final tween =
        Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
    final curveTween = CurveTween(curve: Curves.easeInOut);
    return animation.drive(curveTween).drive(tween);
  }

  Widget get screen;
}
