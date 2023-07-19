import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:flutter/material.dart';

class RootContentContainer extends StatelessWidget {
  final Widget? child;

  const RootContentContainer({super.key, this.child = const Stack()});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
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
