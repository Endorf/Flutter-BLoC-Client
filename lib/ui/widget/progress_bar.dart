import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  final double _progreeIndicatorHeight = 3;

  final bool isLoading;

  const LinearProgressBar({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _progreeIndicatorHeight,
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
