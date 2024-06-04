import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';
import 'package:retroDownloader/app/shared/components/enums/app_input_type.dart';
import 'package:retroDownloader/app/shared/components/form/app_field/text_controller.dart';
import 'package:retroDownloader/app/shared/components/utils/w.dart';

class AppField extends StatelessWidget {
  final double columnLength;
  final TextController controller;
  final AppInputType? type;
  final bool required;
  final Function(String) onChanged;
  final Function(String)? onFocus;
  final bool obscure;
  final String? label;
  final String? hint;
  final String? helper;
  final Function()? onTap;
  Future<void> Function()? onSearchTap;
  Future<void> Function()? onCalendarTap;
  final bool readOnly;
  final bool disable;
  final String? Function(String)? onValid;
  final List<TextInputFormatter>? inputFormatters;
  Future<void> Function(String)? onSubmitted;
  final int maxLenght;
  final int? maxLines;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Axis? axis;
  final double? translationX;
  final int flexLabel;
  final int flexValue;
  final TextAlign? textAlign;
  bool fromTable = false;
  final EdgeInsets margin;
  final int maxLineCharacteres;

  AppField({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.onFocus,
    this.columnLength = 1,
    this.required = false,
    this.obscure = false,
    this.hint,
    this.helper,
    this.onTap,
    this.onValid,
    this.inputFormatters,
    this.readOnly = false,
    this.disable = false,
    this.maxLenght = TextField.noMaxLength,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.onSubmitted,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.type,
    this.maxLineCharacteres = 0,
  });

  AppField.text({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.onFocus,
    this.columnLength = 1,
    this.required = false,
    this.obscure = false,
    this.hint,
    this.helper,
    this.onTap,
    this.onValid,
    this.inputFormatters,
    this.readOnly = false,
    this.disable = false,
    this.maxLenght = TextField.noMaxLength,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.onSubmitted,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.type,
    this.maxLineCharacteres = 0,
  });

  AppField.search({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.onFocus,
    required this.onSubmitted,
    required this.onSearchTap,
    this.columnLength = 1,
    this.required = false,
    this.obscure = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.inputFormatters,
    this.readOnly = false,
    this.disable = false,
    this.maxLenght = TextField.noMaxLength,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.maxLineCharacteres = 0,
  }) : type = AppInputType.search;

  AppField.number({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.onFocus,
    this.columnLength = 1,
    this.required = false,
    this.obscure = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.inputFormatters,
    this.readOnly = false,
    this.disable = false,
    this.maxLenght = TextField.noMaxLength,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.maxLineCharacteres = 0,
  }) : type = AppInputType.number;

  AppField.cpf({
    super.key,
    required this.controller,
    this.label,
    required this.onChanged,
    this.onFocus,
    this.columnLength = 1,
    this.required = false,
    this.obscure = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.inputFormatters,
    this.readOnly = false,
    this.disable = false,
    this.maxLenght = TextField.noMaxLength,
    this.maxLines,
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.maxLineCharacteres = 0,
  }) : type = AppInputType.cpf;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SizedBox(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onExit: (_) {
            controller.hasHover = false;
          },
          onEnter: (_) {
            controller.hasHover = true;
          },
          child: Focus(
            onFocusChange: (hasFocus) {
              controller.hasFocus = hasFocus;
              onChanged.call(controller.value);
              if (hasFocus) {
                controller.focus.requestFocus();
              }
            },
            child: Container(
              padding: padding ??
                  (label != null
                      ? const EdgeInsets.symmetric(vertical: 8)
                      : const EdgeInsets.only(top: 0, bottom: 8)),
              child: axis == Axis.vertical
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (label != null && label!.isNotEmpty) _label,
                        _textField(),
                      ],
                    )
                  : Row(
                      children: [
                        if (label != null && label!.isNotEmpty)
                          Expanded(flex: flexLabel, child: _label),
                        const W(8),
                        Expanded(flex: flexValue, child: _textField()),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _label {
    return Container(
      margin: EdgeInsets.only(
        right: axis == Axis.vertical ? 0 : 4,
        bottom: axis == Axis.vertical ? 4 : 0,
      ),
      child: SelectableText(
        label ?? (required ? '*' : ''),
        textAlign: textAlign,
        maxLines: 1,
        style: AppTheme.text.labelMedium!.copyWith(
          color: labelColor,
        ),
      ),
    );
  }

  InkWell _textField() {
    return InkWell(
      onTap: readOnly ? null : onTap,
      child: IgnorePointer(
        ignoring: ignoring,
        child: TextField(
          mouseCursor: mouseCursor,
          enabled: !disable || !readOnly,
          controller: controller.controller,
          textInputAction: TextInputAction.unspecified,
          keyboardType: _keyboardType,
          obscureText: obscure,
          readOnly: readOnly,
          inputFormatters: _inputFormatters,
          cursorColor: color,
          maxLines: maxLines,
          focusNode: controller.focus,
          style: AppTheme.text.bodyMedium!.copyWith(
            color: color,
          ),
          onChanged: (v) {
            onChanged.call(v);
          },
          onSubmitted: (v) => onSubmitted!.call(v),
          decoration: InputDecoration(
            hoverColor: readOnly && (type == AppInputType.search) ? const Color(0xFFF4F6FB) : null,
            filled: true,
            fillColor: readOnly
                ? controller.value.isNotEmpty
                    ? AppColors.white
                    : const Color(0xFFf4f6fb)
                : AppColors.white,
            constraints: const BoxConstraints(),
            hintText: hint ?? '',
            hintStyle: AppTheme.text.bodyMedium!.copyWith(
              color: AppColors.grey[300]!,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 8,
                ),
            border: !fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(width: 0.6, color: borderColor),
                  )
                : InputBorder.none,
            errorBorder: !fromTable
                ? _border.copyWith(
                    borderSide: const BorderSide(width: 0.6, color: AppColors.red),
                  )
                : null,
            focusedErrorBorder: !fromTable
                ? _border.copyWith(
                    borderSide: const BorderSide(width: 0.6, color: AppColors.red),
                  )
                : null,
            enabledBorder: !fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(width: 0.6, color: color),
                  )
                : null,
            focusedBorder: !fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(
                      width: 0.6,
                      color: AppColors.blue[500]!,
                    ),
                  )
                : null,
            disabledBorder: !fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(
                      width: 0.6,
                      color: AppColors.grey[300]!,
                    ),
                  )
                : null,
            isDense: true,
            prefixIcon: prefix,
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 30,
              minWidth: 30,
              maxHeight: 30,
              minHeight: 30,
            ),
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 30,
              minWidth: 30,
              maxHeight: 30,
              minHeight: 30,
            ),
            helperText: helper,
            helperStyle: AppTheme.text.labelSmall!.copyWith(
              color: color,
            ),
            errorStyle: AppTheme.text.labelSmall!.copyWith(
              color: AppColors.red,
            ),
          ),
        ),
      ),
    );
  }

  bool get ignoring {
    if (disable) return true;
    if (type == AppInputType.search) {
      return false;
    }
    if (readOnly) return true;
    return false;
  }

  MouseCursor get mouseCursor {
    if (readOnly) return SystemMouseCursors.basic;
    if (readOnly && (type == AppInputType.search)) {
      return SystemMouseCursors.basic;
    }
    if (type == AppInputType.search) {
      return SystemMouseCursors.click;
    }
    return SystemMouseCursors.basic;
  }

  Widget? get prefix {
    if (readOnly) return null;
    if (type == AppInputType.search) {
      return _morphemeWidget(Icons.search);
    }
    return null;
  }

  Widget? get suffix {
    if (type == AppInputType.search) {
      return _morphemeWidget(Icons.search_sharp);
    } else {
      return null;
    }
  }

  TextInputType get _keyboardType {
    switch (type) {
      case AppInputType.phone:
        return TextInputType.phone;
      case AppInputType.cnpj:
        return TextInputType.number;
      case AppInputType.cpf:
        return TextInputType.number;
      case AppInputType.date:
        return TextInputType.number;
      case AppInputType.dayAndMonth:
        return TextInputType.number;
      case AppInputType.year:
        return TextInputType.number;
      case AppInputType.monthAndYear:
        return TextInputType.number;
      case AppInputType.email:
        return TextInputType.emailAddress;
      case AppInputType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.none;
    }
  }

  List<TextInputFormatter> get _inputFormatters {
    var list = [
      if (inputFormatters != null) ...{...inputFormatters!},
    ];
    return list;
  }

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 0.6,
          color: color,
        ),
      );

  Widget _morphemeWidget(IconData icon) {
    return InkWell(
      onTap: () {
        onSearchTap?.call();
      },
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: iconBackgroundColor,
        ),
        child: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }

  Color get color {
    if (readOnly) {
      return controller.value.isEmpty ? const Color(0xFFf4f6fb) : AppColors.grey[500]!;
    }
    if (disable) {
      return AppColors.grey[300]!;
    }
    if (controller.value.isNotEmpty) {
      return AppColors.grey[500]!;
    }
    if (controller.hasFocus) {
      return controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    if (controller.hasHover) {
      return AppColors.grey[500]!;
    }
    return controller.value.isEmpty ? AppColors.grey[300]! : AppColors.grey[500]!;
  }

  Color get borderColor {
    if (readOnly) {
      return const Color(0xFFf4f6fb);
    }
    if (disable) {
      return AppColors.grey[300]!;
    }
    if (controller.value.isNotEmpty) {
      return AppColors.grey[500]!;
    }
    if (controller.hasFocus) {
      return controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    if (controller.hasHover) {
      return AppColors.grey[500]!;
    }
    return AppColors.grey[300]!;
  }

  Color get labelColor {
    if (readOnly) {
      return AppColors.grey[500]!;
    }
    if (disable) {
      return AppColors.grey[300]!;
    }
    if (controller.hasFocus) {
      return controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    return AppColors.grey[700]!;
  }

  Color get iconColor {
    if (disable) {
      return AppColors.grey[300]!;
    }
    if (controller.value.isNotEmpty) {
      return AppColors.blue[700]!;
    }
    return AppColors.blue[500]!;
  }

  Color get iconBackgroundColor {
    if (disable) {
      return const Color(0xFFF5F5F5);
    }
    if (controller.value.isNotEmpty) {
      return AppColors.blue.withOpacity(0.28);
    }
    return AppColors.blue.withOpacity(0.1);
  }
}
