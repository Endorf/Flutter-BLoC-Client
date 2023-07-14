import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget? childWidget;

  const AppContainer({super.key, this.childWidget = const Stack()});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          radius: 1.2,
          colors: [
            ThemeConfig.experimentalSecondaryColor,
            ThemeConfig.experimentalPrimaryColor,
          ],
        )),
        child: childWidget);
  }
}
