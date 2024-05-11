import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retroDownloader/app/core/components/enums/app_input_type.dart';
import 'package:retroDownloader/app/core/components/form/app_field/text_controller.dart';
import 'package:retroDownloader/app/core/components/utils/w.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';

class AppField extends StatefulWidget {
  final double columnLength;
  final TextController controller;
  final AppInputType? type;
  final bool required;
  final Function(String) onChanged;
  final Function(String)? onFocus;
  final bool obscure;
  final String label;
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
    required this.label,
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
    required this.label,
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

  AppField.cellText({
    super.key,
    required this.controller,
    required this.label,
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
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.maxLineCharacteres = 0,
  })  : type = AppInputType.text,
        fromTable = true;

  AppField.textArea({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged,
    required this.maxLines,
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
    this.padding,
    this.contentPadding,
    this.axis = Axis.vertical,
    this.translationX,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.maxLineCharacteres = 0,
  }) : type = AppInputType.multiline;

  AppField.email({
    super.key,
    required this.controller,
    required this.label,
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
  }) : type = AppInputType.email;

  AppField.phone({
    super.key,
    required this.controller,
    required this.label,
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
  }) : type = AppInputType.phone;

  AppField.date({
    super.key,
    required this.controller,
    required this.label,
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
  }) : type = AppInputType.date;

  AppField.month({
    super.key,
    required this.controller,
    required this.label,
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
  }) : type = AppInputType.monthAndYear;

  AppField.search({
    super.key,
    required this.controller,
    required this.label,
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
    required this.label,
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
    required this.label,
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

  AppField.cnpj({
    super.key,
    required this.controller,
    required this.label,
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
  }) : type = AppInputType.cnpj;

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  // bool isOverlayVisible = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  String? get _mask {
    switch (widget.type) {
      // case AppInputType.cpf:
      //   return AppMasks.cpf;
      // case AppInputType.cnpj:
      //   return AppMasks.cnpj;
      // case AppInputType.phone:
      //   return AppMasks.phone;
      // case AppInputType.date:
      //   return AppMasks.date;
      // case AppInputType.dayAndMonth:
      //   return '00/00';
      // case AppInputType.monthAndYear:
      //   return '00/0000';
      // case AppInputType.year:
      //   return '0000';
      // case AppInputType.timeStamp:
      //   return '00/00/0000 00:00:00';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: SizedBox(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onExit: (_) {
            widget.controller.hasHover = false;
          },
          onEnter: (_) {
            widget.controller.hasHover = true;
          },
          child: Focus(
            onFocusChange: (hasFocus) {
              widget.controller.hasFocus = hasFocus;
              widget.onChanged.call(widget.controller.value);
              if (hasFocus) {
                widget.controller.focus.requestFocus();
              }
            },
            child: Container(
              padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
              child: widget.axis == Axis.vertical
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.label.isNotEmpty) _label,
                        _textField(),
                      ],
                    )
                  : Row(
                      children: [
                        if (widget.label.isNotEmpty)
                          Expanded(flex: widget.flexLabel, child: _label),
                        const W(8),
                        Expanded(flex: widget.flexValue, child: _textField()),
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
        right: widget.axis == Axis.vertical ? 0 : 4,
        bottom: widget.axis == Axis.vertical ? 4 : 0,
      ),
      child: SelectableText(
        widget.label + (widget.required ? '*' : ''),
        textAlign: widget.textAlign,
        maxLines: 1,
        style: AppTheme.text.labelMedium!.copyWith(
          color: labelColor,
        ),
      ),
    );
  }

  InkWell _textField() {
    return InkWell(
      onTap: widget.readOnly ? null : widget.onTap,
      child: IgnorePointer(
        ignoring: ignoring,
        child: TextField(
          mouseCursor: mouseCursor,
          enabled: !widget.disable || !widget.readOnly,
          controller: widget.controller.controller,
          textInputAction: TextInputAction.unspecified,
          keyboardType: _keyboardType,
          obscureText: widget.obscure,
          readOnly: widget.readOnly,
          inputFormatters: _inputFormatters,
          cursorColor: color,
          maxLines: widget.maxLines,
          focusNode: widget.controller.focus,
          style: AppTheme.text.bodyMedium!.copyWith(
            color: color,
          ),
          onChanged: (v) {
            widget.onChanged.call(v);
            // if (widget.controller.hasError) {
            //   _onValid();
            // }
            // if (widget.maxLineCharacteres != 0) {
            //   if (v.split('\n').last.length > widget.maxLineCharacteres) {
            //     final text = '$v\n';
            //     widget.controller.setValue(text);
            //     widget.controller.controller.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
            //     widget.onChanged.call(text);
            //   }
            // } else {
            // }
          },
          onSubmitted: (v) => widget.onSubmitted!.call(v),
          decoration: InputDecoration(
            hoverColor: widget.readOnly && (widget.type == AppInputType.search)
                ? const Color(0xFFF4F6FB)
                : null,
            filled: true,
            fillColor: widget.readOnly
                ? widget.controller.value.isNotEmpty
                    ? AppColors.white
                    : const Color(0xFFf4f6fb)
                : AppColors.white,
            constraints: const BoxConstraints(),
            hintText: '',
            hintStyle: AppTheme.text.bodyMedium!.copyWith(
              color: AppColors.grey[300]!,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 8,
                ),
            border: !widget.fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(width: 0.6, color: borderColor),
                  )
                : InputBorder.none,
            errorBorder: !widget.fromTable
                ? _border.copyWith(
                    borderSide: const BorderSide(width: 0.6, color: AppColors.red),
                  )
                : null,
            focusedErrorBorder: !widget.fromTable
                ? _border.copyWith(
                    borderSide: const BorderSide(width: 0.6, color: AppColors.red),
                  )
                : null,
            enabledBorder: !widget.fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(width: 0.6, color: color),
                  )
                : null,
            focusedBorder: !widget.fromTable
                ? _border.copyWith(
                    borderSide: BorderSide(
                      width: 0.6,
                      color: AppColors.blue[500]!,
                    ),
                  )
                : null,
            disabledBorder: !widget.fromTable
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
            helperText: widget.helper,
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
    if (widget.disable) return true;
    if (widget.type == AppInputType.search) {
      return false;
    }
    if (widget.readOnly) return true;
    return false;
  }

  MouseCursor get mouseCursor {
    if (widget.readOnly) return SystemMouseCursors.basic;
    if (widget.readOnly && (widget.type == AppInputType.search)) {
      return SystemMouseCursors.basic;
    }
    if (widget.type == AppInputType.search) {
      return SystemMouseCursors.click;
    }
    return SystemMouseCursors.basic;
  }

  Widget? get prefix {
    if (widget.readOnly) return null;
    if (widget.type == AppInputType.search) {
      // return _morphemeWidget(AppIcons.search, widget.type);
    }
    return null;
  }

  Widget? get suffix {
    if (widget.readOnly) return null;
    if (widget.type == AppInputType.search) {
      return _morphemeWidget(Icons.search_sharp, widget.type);
    }
    // if ((widget.controller.type == TextControllerType.date || widget.type == AppInputType.date)) {
    //   return _morphemeWidget(Icons.date_range, widget.type);
    // }
    return null;
  }

  TextInputType get _keyboardType {
    switch (widget.type) {
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
    //if (widget.type == null) return [widget.controller.type.formatter];
    //if (widget.type == null) return [widget.controller.type.formatter];
    var list = [
      if (widget.inputFormatters != null) ...{...widget.inputFormatters!},
      // if (widget.type == AppInputType.number) NumberFormatter(maxLenght: widget.maxLenght),
      // if (widget.type == AppInputType.cnpj) NumberTextFormatter('.-/'),
      // if (widget.type == AppInputType.cpf) NumberTextFormatter('.-'),
      // if ((widget.controller.type == TextControllerType.date || widget.type == AppInputType.date))
      // DateInputFormatter(),
      // if (widget.type == AppInputType.monthAndYear) NumberTextFormatter('/', maxLenght: 6),
      // if (widget.type == AppInputType.dayAndMonth) NumberTextFormatter('/', maxLenght: 5),
      // if (widget.type == AppInputType.year) NumberTextFormatter('', maxLenght: 4),
      // if (widget.maxLineCharacteres > 0) MaxLengthLineFormatter(widget.maxLineCharacteres),
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

  Widget _morphemeWidget(IconData icon, AppInputType? type) {
    return InkWell(
      //key: calendarOverlaydStream.value.key,
      onTap: () {
        // if (type == AppInputType.date) {
        //   onClickMorphemeDate();
        //   return;
        // }
        if (!widget.readOnly) {
          widget.onSearchTap?.call();
        }
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
    if (widget.readOnly) {
      return widget.controller.value.isEmpty ? const Color(0xFFf4f6fb) : AppColors.grey[500]!;
    }
    if (widget.disable) {
      return AppColors.grey[300]!;
    }
    if (widget.controller.value.isNotEmpty) {
      return AppColors.grey[500]!;
    }
    if (widget.controller.hasFocus) {
      return widget.controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    if (widget.controller.hasHover) {
      return AppColors.grey[500]!;
    }
    return widget.controller.value.isEmpty ? AppColors.grey[300]! : AppColors.grey[500]!;
  }

  Color get borderColor {
    if (widget.readOnly) {
      return const Color(0xFFf4f6fb);
    }
    if (widget.disable) {
      return AppColors.grey[300]!;
    }
    if (widget.controller.value.isNotEmpty) {
      return AppColors.grey[500]!;
    }
    if (widget.controller.hasFocus) {
      return widget.controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    if (widget.controller.hasHover) {
      return AppColors.grey[500]!;
    }
    return AppColors.grey[300]!;
  }

  Color get labelColor {
    if (widget.readOnly) {
      return AppColors.grey[500]!;
    }
    if (widget.disable) {
      return AppColors.grey[300]!;
    }
    if (widget.controller.hasFocus) {
      return widget.controller.hasError ? AppColors.red : AppColors.blue[500]!;
    }
    return AppColors.grey[700]!;
  }

  Color get iconColor {
    if (widget.disable) {
      return AppColors.grey[300]!;
    }
    if (widget.controller.value.isNotEmpty) {
      return AppColors.blue[700]!;
    }
    return AppColors.blue[500]!;
  }

  Color get iconBackgroundColor {
    if (widget.disable) {
      return const Color(0xFFF5F5F5);
    }
    if (widget.controller.value.isNotEmpty) {
      return AppColors.blue.withOpacity(0.28);
    }
    return AppColors.blue.withOpacity(0.1);
  }

  // bool isValidDate(String input) {
  //   try {
  //     final date = DateFormat('dd/MM/yyyy').parse(input);
  //     if (date.day < 1 || date.day > 31) return false;
  //     if (date.month < 1 || date.month > 12) return false;
  //     if (date.year < 1950 || date.year > 3000) return false;
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<void> onClickMorphemeDate() async {
    //if (datePickerOverlayd != null) return;
    //final type = getCalendarType();
    //final date = await _showOverlay(context, type);
    //disposeDatePicker();
    //if (date == null) return;
    //widget.controller.setValue(DateFormat(type.format).format(date));
    widget.onChanged.call(widget.controller.value);
  }

  // Future<DateTime?> _showOverlay(BuildContext context, AppCalendarType type) {
  //   Completer<DateTime?> completer = Completer<DateTime?>();

  //   calculateOverlayPos();
  //   datePickerOverlayd = OverlayEntry(
  //     builder: (BuildContext context) {
  //       return StreamOut<OverlaydModel>(
  //         loading: const SizedBox(),
  //         stream: calendarOverlaydStream.listen,
  //         child: (_, position) => Positioned(
  //           left: position.left,
  //           right: position.right,
  //           top: position.top,
  //           bottom: position.bottom,
  //           child: AppCalendarWidget(
  //             datePickerOverlayd,
  //             completer,
  //             type: getCalendarType(),
  //             initialDate: getCurrentDateTime(type),
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   Overlay.of(context).insert(datePickerOverlayd!);

  //   UtilsController().overlaidsStream.update();

  //   return completer.future;
  // }

  // void calculateOverlayPos() {
  //   RenderBox renderBox =
  //       calendarOverlaydStream.value.key.currentContext?.findRenderObject() as RenderBox;
  //   Offset centerOffset = renderBox.localToGlobal(renderBox.size.center(Offset.zero));

  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double screenHeight = MediaQuery.of(context).size.height;

  //   calendarOverlaydStream.value.left = centerOffset.dx <= screenWidth / 2 ? centerOffset.dx : null;
  //   calendarOverlaydStream.value.right =
  //       centerOffset.dx > screenWidth / 2 ? screenWidth - centerOffset.dx : null;
  //   calendarOverlaydStream.value.top = centerOffset.dy <= screenHeight / 2 ? centerOffset.dy : null;
  //   calendarOverlaydStream.value.bottom =
  //       centerOffset.dy > screenHeight / 2 ? screenHeight - centerOffset.dy : null;
  //   calendarOverlaydStream.update();
  // }

  // AppCalendarType getCalendarType() {
  //   if (widget.controller.type.isDateType) return widget.controller.type.calendarType;
  //   if (widget.type != null && widget.type!.isDateType) {
  //     return widget.type!.calendarType;
  //   }
  //   return AppCalendarType.date;
  // }

  // DateTime? getCurrentDateTime(AppCalendarType type) {
  //   try {
  //     return DateFormat(type.format).parse(widget.controller.value);
  //   } catch (_) {
  //     return null;
  //   }
  // }
}
