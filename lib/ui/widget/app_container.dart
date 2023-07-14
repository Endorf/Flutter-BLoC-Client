import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;

  const AppContainer({super.key, this.child = const Stack()});

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
        child: child);
  }
}
