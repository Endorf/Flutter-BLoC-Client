import 'package:bloc_app/ui/screen/base_page.dart';
import 'package:bloc_app/ui/screen/login/login.dart';
import 'package:bloc_app/ui/theme/resources/pages.dart';
import 'package:flutter/material.dart';

class LoginPage extends BasePage {
  const LoginPage() : super(Pages.login);

  @override
  Widget get screen => const LoginScreen();
}
