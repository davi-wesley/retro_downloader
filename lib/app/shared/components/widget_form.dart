import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  final double columnLength;
  final Widget child;
  final double? width;

  const WidgetForm({
    required this.columnLength,
    required this.child,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ??
          columnLength * (MediaQuery.of(context).size.width / 6.5) + ((columnLength - 1) * 8),
      child: child,
    );
  }
}
