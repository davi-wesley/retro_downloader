import 'package:flutter/cupertino.dart';
import 'package:retroDownloader/app/shared/components/widget_form.dart';

class AppText extends StatelessWidget {
  final String value;
  final double columnLength;
  final TextStyle? style;

  const AppText(this.value, {this.columnLength = 1, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetForm(
      columnLength: columnLength,
      child: Text(
        value,
        style: style ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF454950),
            ),
      ),
    );
  }
}
