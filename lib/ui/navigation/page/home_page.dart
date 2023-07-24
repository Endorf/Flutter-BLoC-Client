import 'package:bloc_app/ui/screen/base_page.dart';
import 'package:bloc_app/ui/screen/home/home.dart';
import 'package:bloc_app/ui/theme/resources/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage {
  const HomePage() : super(Pages.home);

  @override
  Widget get screen => const HomeScreen();
}
