import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:retroDownloader/app/shared/components/app_shimmer.dart';
import 'package:retroDownloader/app/shared/components/form/app_button/app_button_style.dart';

class AppButton extends StatefulWidget {
  final String label;
  final Function()? onPressed;
  final bool expanded;
  final double columnLength;
  final bool enabled;
  final EdgeInsets? margin;
  final AppButtonStyle style;
  final bool loading;
  final int? idFuncao;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.style,
    this.expanded = false,
    this.columnLength = 1,
    this.enabled = true,
    this.margin,
    this.idFuncao,
    this.loading = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool get isEnable => widget.enabled && (isEnableFunc ?? false);

  bool? isEnableFunc = true;
  bool isLoading = false;

  @override
  void initState() {
    if (widget.idFuncao != null) fecthIsEnableFunc();
    super.initState();
  }

  void fecthIsEnableFunc() async {
    setState(() => isEnableFunc = null);
  }

  @override
  Widget build(BuildContext context) {
    return widget.expanded
        ? Expanded(
            child: _button(context),
          )
        : _button(context);
  }

  Widget _button(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(top: 0),
      child: AppShimmer(
        enable: isEnableFunc == null || widget.loading || isLoading,
        child: IgnorePointer(
          ignoring: !isEnable || widget.loading,
          child: LayoutBuilder(
            builder: (_, constraints) => TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: isEnable
                          ? widget.style.borderEnableColor
                          : widget.style.borderDisableColor,
                      width: 1,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  isEnable
                      ? widget.style.backgroundEnableColor
                      : widget.style.backgroundDisableColor,
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    constraints.maxWidth,
                    38,
                  ),
                ),
              ),
              onPressed: !isEnable
                  ? null
                  : () async {
                      if (widget.onPressed is Future Function()) {
                        setState(() => isLoading = true);
                        try {
                          await widget.onPressed!.call();
                        } catch (e, stacktrace) {
                          log(e.toString());
                          log(stacktrace.toString());
                        }
                        setState(() => isLoading = false);
                      } else {
                        widget.onPressed!.call();
                      }
                    },
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16,
                  color: isEnable ? widget.style.textEnableColor : widget.style.textDisableColor,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
