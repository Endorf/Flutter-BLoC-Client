import 'package:bloc_app/service_locator.dart';
import 'package:flutter/material.dart';

import 'application.dart';

void main() {
  configureDependencies();
  runApp(Application());
}
