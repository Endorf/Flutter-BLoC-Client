import 'package:bloc_app/ui/screen/base_page.dart';
import 'package:bloc_app/ui/theme/resources/pages.dart';
import 'package:bloc_app/ui/screen/splash/splash.dart';
import 'package:flutter/material.dart';

class SplashPage extends BasePage {
  const SplashPage() : super(Pages.splash);

  @override
  Widget get screen => const SplashScreen();

  @override
  Widget provideTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
