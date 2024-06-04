import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final BorderRadius? border;
  final EdgeInsets? padding;
  final Widget child;

  const AppContainer({super.key, required this.child, this.border, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: border ?? BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
