import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const AppCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        side: const BorderSide(
          color: AppColors.greyPrimaryComponent, // Cor da borda
          width: 1.0, // Espessura da borda
        ),
        value: value,
        activeColor: AppColors.primary,
        checkColor: AppColors.white,
        onChanged: (v) => onChanged.call(v));
  }
}
