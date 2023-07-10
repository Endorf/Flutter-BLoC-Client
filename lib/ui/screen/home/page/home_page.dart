import 'package:bloc_app/ui/screen/home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: const HomeScreen(),
        );
      },
    );
  }
}
