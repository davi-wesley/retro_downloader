import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';
import 'package:retroDownloader/app/shared/components/utils/h.dart';

class AppTitleBox extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final double width;
  final bool withBorder;
  final BoxDecoration? boxDecoration;
  final double? columnLength;
  final bool removeFinalSpace;

  const AppTitleBox(
    this.title, {
    this.padding,
    this.width = double.maxFinite,
    this.boxDecoration,
    this.withBorder = true,
    this.columnLength,
    this.removeFinalSpace = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.only(left: 16, bottom: 4, top: 16),
          child: Text(
            title.toUpperCase(),
            style: AppTheme.text.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF006877),
              fontSize: 12,
            ),
          ),
        ),
        if (withBorder)
          Container(
            width: double.maxFinite,
            height: 1,
            color: const Color(0xFFE5EBF1),
          ),
        if (!removeFinalSpace) const H(8)
      ],
    );
  }
}
