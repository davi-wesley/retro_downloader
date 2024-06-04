import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';
import 'package:retroDownloader/app/shared/components/utils/h.dart';
import 'package:retroDownloader/app/shared/components/utils/w.dart';

class AppTextBox extends StatelessWidget {
  final double columnLength;
  final double? height;
  final String label;
  final dynamic value;
  final bool required;
  final bool disable;
  final Axis axis;
  final int flexLabel;
  final int flexValue;
  final TextAlign? textAlign;

  const AppTextBox({
    required this.label,
    this.value = '',
    this.columnLength = 1,
    this.required = false,
    this.disable = false,
    this.height,
    this.axis = Axis.vertical,
    this.flexLabel = 2,
    this.flexValue = 2,
    this.textAlign,
    super.key,
  });

  bool get isHorizontal => axis == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.4),
      child: isHorizontal
          ? Row(
              children: childrens(context),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: childrens(context),
            ),
    );
  }

  List<Widget> childrens(BuildContext context) {
    var container = Container(
      padding: const EdgeInsets.symmetric(vertical: 6.8),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFF4F6FB),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SelectableText(
          value.toString() == 'null' ? '' : value.toString(),
          style: AppTheme.text.bodyMedium!.copyWith(
            color: disable ? const Color(0xFFACB7C5) : const Color(0xFF454950),
          ),
        ),
      ),
    );
    var text = SelectableText(
      label + (required ? '*' : ''),
      maxLines: 1,
      textAlign: textAlign ?? (isHorizontal ? TextAlign.end : TextAlign.start),
      style: AppTheme.text.labelMedium!.copyWith(
        color: const Color(0xFF848A90),
      ),
    );
    return [
      if (label.isNotEmpty) ...{
        isHorizontal
            ? Expanded(
                flex: flexLabel,
                child: text,
              )
            : text,
        isHorizontal ? const W(8) : const H(4),
      },
      isHorizontal
          ? Expanded(
              flex: flexValue,
              child: container,
            )
          : Row(
              children: [
                Expanded(child: container),
              ],
            ),
    ];
  }
}
