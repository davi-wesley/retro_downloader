import 'package:flutter/material.dart';

class EmptyColumn extends StatelessWidget {
  final double? columnLength;
  final double? height;

  const EmptyColumn([this.columnLength, this.height, Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
