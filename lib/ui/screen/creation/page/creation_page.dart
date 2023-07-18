import 'package:bloc_app/ui/screen/base_page.dart';
import 'package:bloc_app/ui/screen/creation/creation.dart';
import 'package:bloc_app/ui/theme/resources/pages.dart';
import 'package:flutter/material.dart';

class CreationPage extends BasePage {
  const CreationPage() : super(Pages.creation);

  @override
  Widget get screen => const CreationScreen();
}
