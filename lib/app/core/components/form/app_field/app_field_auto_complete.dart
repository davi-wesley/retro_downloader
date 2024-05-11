import 'dart:developer';

import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/components/app_checkbox_simple.dart';
import 'package:retroDownloader/app/core/components/app_shimmer.dart';
import 'package:retroDownloader/app/core/components/enums/app_input_type.dart';
import 'package:retroDownloader/app/core/components/form/app_field/text_controller.dart';
import 'package:retroDownloader/app/core/components/stream_out.dart';
import 'package:retroDownloader/app/core/components/utils/app_stream.dart';
import 'package:retroDownloader/app/core/components/utils/h.dart';
import 'package:retroDownloader/app/core/components/utils/w.dart';
import 'package:retroDownloader/app/core/global_resources.dart';
import 'package:retroDownloader/app/core/models/console_model.dart';
import 'package:retroDownloader/app/core/models/suggestion.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';

class AppFieldAutoComplete<T> extends StatefulWidget {
  final double columnLength;
  final TextController<T> controller;
  final AppInputType type;
  final bool required;
  final Function() onAddStream;
  final String label;
  final String? hint;
  final String? helper;
  final Function()? onTap;
  final Function()? onSearchTap;
  final bool readOnly;
  final bool disable;
  final String? Function(String)? onValid;
  final List<Suggestion<T>>? suggestions;
  final void Function(dynamic)? onSelect;
  final void Function(dynamic)? onSelectTable;
  final MainAxisAlignment? mainAxisAlignment;
  final int? idQuery;
  final List<dynamic>? values;
  final Axis? axis;
  final bool selectable;
  final int flexLabel;
  final int flexValue;
  final TextAlign? textAlign;
  final Function? onUpdate;
  final bool compare;

  const AppFieldAutoComplete.text({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.helper,
    this.onTap,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.idQuery,
    this.values,
    this.mainAxisAlignment,
    this.onSearchTap,
    this.axis,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.selectable = false,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.text;

  const AppFieldAutoComplete.email({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.email;

  const AppFieldAutoComplete.phone({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.phone;

  const AppFieldAutoComplete.date({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.date;

  const AppFieldAutoComplete.search({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.search;

  const AppFieldAutoComplete.number({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.number;

  const AppFieldAutoComplete.cpf({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.cpf;

  const AppFieldAutoComplete.cnpj({
    super.key,
    required this.controller,
    required this.label,
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.cnpj;

  const AppFieldAutoComplete.cellTable({
    super.key,
    required this.controller,
    this.label = '',
    required this.onAddStream,
    this.suggestions,
    this.columnLength = 1,
    this.required = false,
    this.hint,
    this.onTap,
    this.helper,
    this.onValid,
    this.readOnly = false,
    this.disable = false,
    this.onSelect,
    this.onSelectTable,
    this.mainAxisAlignment,
    this.idQuery,
    this.values,
    this.onSearchTap,
    this.axis,
    this.selectable = false,
    this.flexLabel = 1,
    this.flexValue = 1,
    this.textAlign = TextAlign.right,
    this.onUpdate,
    this.compare = true,
  }) : type = AppInputType.number;

  @override
  State<AppFieldAutoComplete<T>> createState() => AppFieldAutoCompleteState<T>();
}

class AppFieldAutoCompleteState<T> extends State<AppFieldAutoComplete<T>> {
  late AppStream<bool> isOpen;
  bool containsObject = false;
  String? lastInput;

  @override
  void initState() {
    if (widget.controller.controller != null) {
      containsObject = widget.controller.hasObject;
    }
    //_fetchRequest();
    isOpen = AppStream<bool>.seeded(widget.controller.isOpen);
    // if (widget.controller.controller is! MaskedTextController) {
    //   final mask = _mask;
    //   if (mask != null) {
    //     widget.controller.controller = MaskedTextController(
    //       mask: _mask,
    //       text: widget.controller.controller.value.text,
    //     );
    //   }
    // }
    //_setValueWhenOnlyId();
    super.initState();
  }

  String? _paramIdReleased;

  bool get _isSuggestion => widget.idQuery == null;
  //bool get _isReleasedRequest => _paramIdReleased == null || _paramIdReleased != _paramsIdCurrent;

  ///bool get _hasKeysValues => widget.keys != null && widget.values != null;

  // String get _paramsIdCurrent => _hasKeysValues
  //     ? (widget.values ?? [])
  //         .map((e) => e is TextController ? e.value.toString() : e.toString())
  //         .toList()
  //         .toString()
  //     : empty;

  // List<dynamic> getParamsValues() {
  //   List<dynamic> paramsValues = [];
  //   for (final value in widget.values ?? []) {
  //     if (value is TextController<ConsoleModel>) {
  //       if (value.hasObject) {
  //         paramsValues.add(value.object!.id);
  //       }
  //     } else if (value is TextController) {
  //       if (value.hasObject) {
  //         paramsValues.add(value.value);
  //       }
  //     } else {
  //       paramsValues.add(value);
  //     }
  //   }
  //   return paramsValues;
  // }

  // Map<String, dynamic> _bodyRequest(List<dynamic> values) {
  //   Map<String, dynamic> body = {'id_query': widget.idQuery, 'parametros': []};
  //   if ((widget.keys ?? []).isNotEmpty) {
  //     for (var i = 0; i < widget.keys!.length; i++) {
  //       body['parametros'].add({
  //         'nome': widget.keys![i].name,
  //         'valor': values[i],
  //       });
  //     }
  //   } else {
  //     body['parametros'].add({
  //       'nome': '',
  //       'valor': '',
  //     });
  //   }
  //   return body;
  // }

  // Future<void> _fetchRequest() async {
  //   try {
  //     if (_isSuggestion) {
  //       if (!stream.hasValidData) {
  //         stream.add(ApiResponse.complete(<ConsoleModel>[]));
  //       }
  //       return;
  //     }
  //     if (!_isReleasedRequest) return;

  //     stream.add(ApiResponse<List<ConsoleModel>>.loading());

  //     final paramsValue = getParamsValues();

  //     if (_hasKeysValues && widget.keys!.length != paramsValue.length) {
  //       stream.add(ApiResponse.complete(<ConsoleModel>[]));
  //       return;
  //     }

  //     if (widget.controller.controller != null) {
  //       containsObject = widget.controller.hasObject;
  //     }

  //     if (!containsObject) {
  //       WidgetsBinding.instance.addPostFrameCallback((_) => widget.controller.clear());
  //     }
  //     _paramIdReleased = _paramsIdCurrent;
  //     final response = await ComumProvider.getConsulta(_bodyRequest(paramsValue));
  //     if (response.hasData) {
  //       // response.data.sort((a, b) => a.descr.compareTo(b.descr));
  //       stream.add(response);
  //     } else {
  //       stream.add(ApiResponse.complete(<ConsoleModel>[]));
  //     }
  //     _setValueWhenOnlyId();
  //   } catch (_) {}
  // }

  List<Suggestion<T>> get suggestions {
    late List<Suggestion<T>> sugestionList;
    try {
      if (widget.suggestions != null) {
        sugestionList = widget.suggestions!;
      }
    } catch (e) {
      sugestionList = widget.suggestions ?? [];
    }
    if (widget.selectable) {
      if (!sugestionList.map((e) => e.name).contains('Selecionar Todos')) {
        //sugestionList.insert(0, Suggestion('Selecionar Todos', ConsoleModel(isDummy: true) as T));
      }
    }
    return sugestionList;
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
      default:
        return null;
    }
  }

  // void _setValueWhenOnlyId() {
  //   try {
  //     if (widget.controller.object == null) return;
  //     if (widget.controller.object is! ConsoleModel) return;
  //     if ((widget.controller.object as ConsoleModel).descr.isNotEmpty) return;
  //     for (var suggestion in suggestions) {
  //       if (suggestion.object is ConsoleModel) {
  //         if ((suggestion.object as ConsoleModel).id ==
  //             (widget.controller.object as ConsoleModel).id) {
  //           WidgetsBinding.instance.addPostFrameCallback((_) {
  //             widget.controller.setObject(
  //               (suggestion.object as ConsoleModel).id,
  //               (suggestion.object as ConsoleModel).descr,
  //               (suggestion.object as ConsoleModel).flag,
  //             );
  //             widget.onAddStream.call();
  //             widget.controller.boxController.close?.call();
  //           });
  //         }
  //       }
  //     }
  //   } catch (_) {}
  // }

  @override
  Widget build(BuildContext context) {
    return _fieldConfig();
    // _fetchRequest();
    // _setValueWhenOnlyId();
    // return StreamOutResponse<ApiResponse<List<ConsoleModel>>, List<ConsoleModel>>(
    //   stream: stream.listen,
    //   loading: _shimmerWidget(context),
    //   child: (_, models) => widget.table != null
    //       ? AppTableContainerSelected(
    //           widget.table!.controller,
    //           widget.table!.register,
    //           widget.table!.cell,
    //           child: _fieldConfig(),
    //         )
    //       : _fieldConfig(),
    // );
  }

  MouseRegion _fieldConfig() {
    return MouseRegion(
      onExit: (_) {
        widget.controller.hasHover = false;
      },
      onEnter: (_) {
        widget.controller.hasHover = true;
      },
      child: InkWell(
        onFocusChange: (hasFocus) async {
          widget.controller.boxController.close?.call();
          widget.controller.hasFocus = hasFocus;
          if (hasFocus) {
            isOpen.add(true);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.controller.boxController.open?.call();
              widget.controller.boxController.refresh?.call();
            });
          } else {
            isOpen.add(false);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.controller.boxController.close?.call();
            });
            widget.onUpdate?.call();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Builder(
            builder: (context) {
              if ((widget.axis ?? Axis.vertical) == Axis.horizontal) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: widget.flexLabel,
                          child: SelectionArea(
                            child: SelectableText(
                              widget.label + (widget.required ? '*' : ''),
                              maxLines: 1,
                              textAlign: widget.textAlign,
                              style: AppTheme.text.labelMedium!.copyWith(
                                color: labelColor,
                              ),
                            ),
                          ),
                        ),
                        const W(12),
                        Expanded(
                          flex: widget.flexValue,
                          child: _field(context),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
                  children: [
                    if (widget.label.isNotEmpty) ...{
                      SelectionArea(
                        child: Text(
                          widget.label + (widget.required ? '*' : ''),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: AppTheme.text.labelMedium!.copyWith(
                            color: labelColor,
                          ),
                        ),
                      ),
                      const H(4),
                    },
                    _field(context)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  InkWell _field(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      mouseCursor: mouseCursor,
      child: IgnorePointer(
        ignoring: ignoring,
        child: FieldSuggestion(
          key: widget.controller.key,
          focusNode: widget.controller.focus,
          textController: widget.controller.controller,
          boxController: widget.controller.boxController,
          suggestions: suggestions,
          search: (item, input) => _compareStrings(item.name, input),
          itemBuilder: (_, i) {
            return i < 0
                ? const SizedBox()
                : suggestionItem(
                    context,
                    suggestions[i],
                    i == 0,
                    i == suggestions.length - 1,
                  );
          },
          inputDecoration: _decoration(),
          inputType: _keyboardType,
          inputStyle: AppTheme.text.bodyMedium!.copyWith(
            color: color,
            fontSize: 12,
          ),
          cursorColor: color,
          maxLines: 1,
          boxStyle: BoxStyle(
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3.0,
                spreadRadius: 0.5,
                offset: const Offset(
                  0.0,
                  4.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmerWidget(BuildContext context) {
    // if (widget.table != null) {
    //   return AppShimmer(
    //     child: Container(
    //       width: double.maxFinite,
    //       color: Colors.grey,
    //     ),
    //   );
    // }
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          if (widget.label.isNotEmpty) ...{
            Text(
              widget.label + (widget.required ? '*' : ''),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: AppTheme.text.labelMedium!.copyWith(
                color: labelColor,
              ),
            ),
            const H(4),
          },
          AppShimmer(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 0.6,
                  color: color,
                ),
              ),
              height: 28,
            ),
          ),
        ],
      ),
    );
  }

  bool _compareStrings(String item, String _) {
    final String input = lastInput ?? _;
    log(input);
    if (!widget.compare) return true;

    if (widget.selectable) {
      if (item == 'Selecionar Todos' || input == 'Todos') return true;
    }

    if (input.length <= 1) {
      return true;
    }
    final itemCompare = toNonDiacritics(item.toString().toLowerCase().replaceAll(' ', ''));
    final inputCompare = toNonDiacritics(input.toString().toLowerCase().replaceAll(' ', ''));
    return itemCompare.contains(inputCompare);
  }

  InputDecoration _decoration() {
    return InputDecoration(
      constraints: const BoxConstraints(),
      hintText: '',
      hintStyle: AppTheme.text.bodyMedium!.copyWith(
        color: AppColors.grey[300]!,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 11,
      ),
      border: _border.copyWith(
        borderSide: BorderSide(width: 0.6, color: color),
      ),
      errorBorder: _border.copyWith(
        borderSide: const BorderSide(width: 0.6, color: AppColors.red),
      ),
      focusedErrorBorder: _border.copyWith(
        borderSide: const BorderSide(width: 0.6, color: AppColors.red),
      ),
      enabledBorder: _border.copyWith(
        borderSide: BorderSide(width: 0.6, color: color),
      ),
      focusedBorder: _border.copyWith(
        borderSide: BorderSide(
          width: 0.6,
          color: AppColors.blue[500]!,
        ),
      ),
      disabledBorder: _border.copyWith(
        borderSide: BorderSide(
          width: 0.6,
          color: AppColors.grey[300]!,
        ),
      ),
      isDense: true,
      suffixIcon: Row(
        children: [
          if (widget.selectable && widget.compare && lastInput != null)
            InkWell(
              onTap: () {
                setState(() {
                  widget.controller.controller.clear();
                  widget.controller.objectsPrivate.clear();
                  widget.controller.boxController.refresh?.call();
                  widget.onAddStream.call();
                  lastInput = null;
                });
              },
              mouseCursor: SystemMouseCursors.click,
              child: const Icon(
                Icons.close,
                size: 18,
                color: Colors.red,
              ),
            ),
          InkWell(
            onTap: () => _onClickIcon(),
            mouseCursor: SystemMouseCursors.click,
            child: StreamOut(
              loading: const SizedBox(),
              stream: isOpen.listen,
              child: (_, isOpen) => AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: (isOpen ? 180 : 0) / 360,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
      suffixIconConstraints: BoxConstraints(
        maxWidth: widget.selectable && widget.compare && lastInput != null ? 40 : 30,
        minWidth: widget.selectable && widget.compare && lastInput != null ? 40 : 30,
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
    );
  }

  InputDecoration _decorationTableCell() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 8, top: 6),
      constraints: const BoxConstraints(),
      hintText: '',
      hintStyle: AppTheme.text.bodyMedium!.copyWith(
        color: AppColors.grey[300]!,
        fontWeight: FontWeight.w400,
      ),
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      isDense: true,
      suffixIcon: InkWell(
        onTap: () => _onClickIcon(),
        mouseCursor: SystemMouseCursors.click,
        child: StreamOut(
          loading: const SizedBox(),
          stream: isOpen.listen,
          child: (_, isOpen) => AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turns: (isOpen ? 180 : 0) / 360,
            child: Icon(
              Icons.arrow_drop_down,
              size: 18,
              color: iconColor,
            ),
          ),
        ),
      ),
      suffixIconConstraints: const BoxConstraints(
        maxWidth: 20,
        minWidth: 20,
        maxHeight: 20,
        minHeight: 20,
      ),
      helperText: widget.helper,
      helperStyle: AppTheme.text.labelSmall!.copyWith(
        color: color,
      ),
      errorStyle: AppTheme.text.labelSmall!.copyWith(
        color: AppColors.red,
      ),
    );
  }

  void _onClickIcon() {
    if (widget.onSearchTap != null) {
      widget.onSearchTap!.call();
      return;
    }

    if (isOpen.value) {
      widget.controller.boxController.close?.call();
      isOpen.add(false);
    } else {
      widget.controller.boxController.open?.call();
      if (!widget.controller.hasFocus) {
        widget.controller.focus.requestFocus();
      }
      isOpen.add(true);
    }
  }

  bool selectedAll = false;

  Widget suggestionItem(
    BuildContext context,
    Suggestion<T> item,
    bool first,
    bool last,
  ) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (item.name == 'Selecionar Todos') {
              selectedAll = !selectedAll;
              widget.controller.objectsPrivate.clear();
              if (selectedAll) {
                widget.controller.objectsPrivate.addAll(
                  suggestions.map((e) => e.object as ConsoleModel),
                );
              }
              if (widget.controller.objectsPrivate.length == suggestions.length) {
                widget.controller.controller.text = 'Todos';
              } else {
                widget.controller.controller.text =
                    widget.controller.objectsPrivate.map((e) => e.name).toList().join(', ');
              }
              widget.controller.boxController.refresh?.call();
              widget.onAddStream.call();
              return;
            }
            setState(() {
              if (widget.selectable) {
                if (widget.controller.objectsPrivate
                    .map((e) => e.path)
                    .toList()
                    .contains((item.object as ConsoleModel).path)) {
                  final i = widget.controller.objectsPrivate
                      .map((e) => e.path)
                      .toList()
                      .indexOf((item.object as ConsoleModel).path);
                  widget.controller.objectsPrivate.removeAt(i);
                } else {
                  widget.controller.objectsPrivate.add(item.object as ConsoleModel);
                }
                lastInput ??= widget.controller.controller.text;
                widget.controller.controller.text =
                    widget.controller.objectsPrivate.map((e) => e.name).toList().join(', ');

                widget.controller.boxController.refresh?.call();
                widget.onAddStream.call();
              } else {
                widget.controller.controller.text = item.name;
                if (widget.controller.hasObject) {
                  widget.controller.lastObject = item.object;
                }
                widget.controller.object = item.object;
                isOpen.add(false);
                widget.onAddStream.call();
                widget.controller.boxController.close?.call();
                if (widget.onSelect != null) widget.onSelect!(item.object);
                widget.controller.focus.unfocus();
              }
            });
          },
          child: Container(
            padding: EdgeInsets.only(
              top: first ? 0 : 6,
              bottom: last ? 0 : 6,
            ),
            child: Row(
              children: [
                if (widget.selectable)
                  IgnorePointer(
                    ignoring: true,
                    child: AppCheckboxSimple(
                      value: widget.controller.objectsPrivate
                          .map((e) => e.path)
                          .contains((item.object as ConsoleModel).path),
                      onChanged: (_) {
                        setState(() {
                          if (widget.selectable) {
                            if (widget.controller.objectsPrivate
                                .map((e) => e.path)
                                .toList()
                                .contains((item.object as ConsoleModel).path)) {
                              final i = widget.controller.objectsPrivate
                                  .map((e) => e.path)
                                  .toList()
                                  .indexOf((item.object as ConsoleModel).path);
                              widget.controller.objectsPrivate.removeAt(i);
                            } else {
                              widget.controller.objectsPrivate.add(item.object as ConsoleModel);
                            }
                            widget.controller.controller.text = widget.controller.objectsPrivate
                                .map((e) => e.name)
                                .toList()
                                .join(', ');

                            widget.controller.boxController.refresh?.call();
                            widget.onAddStream.call();
                          } else {
                            widget.controller.controller.text = item.name;
                            if (widget.controller.hasObject) {
                              widget.controller.lastObject = item.object;
                            }
                            widget.controller.object = item.object;
                            isOpen.add(false);
                            widget.onAddStream.call();
                            widget.controller.boxController.close?.call();
                            if (widget.onSelect != null) widget.onSelect!(item.object!);
                            widget.controller.focus.unfocus();
                          }
                        });
                      },
                    ),
                  ),
                if (widget.selectable) const W(12),
                if (widget.selectable) const W(12),
                Expanded(
                  child: Text(
                    item.name,
                    style: AppTheme.text.bodySmall!.copyWith(color: AppColors.grey[700]),
                  ),
                ),
                if (widget.selectable && item.name == 'Selecionar Todos') const W(12),
                if (widget.selectable && item.name == 'Selecionar Todos')
                  InkWell(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      //await widget.onConfirmSelect?.call(widget.controller.objectsPrivate);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Ok',
                        style: AppTheme.text.bodyLarge!.copyWith(color: const Color(0xFF00AEC7)),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool containsInSelected(itens, item) {
    bool selected = itens.map((i) => i.codigo).contains(item.object.codigo);
    return selected;
  }

  bool get ignoring => widget.disable || widget.readOnly;

  MouseCursor get mouseCursor {
    if (widget.readOnly) return SystemMouseCursors.basic;
    if (widget.type == AppInputType.search || widget.type == AppInputType.date) {
      return SystemMouseCursors.click;
    }
    return SystemMouseCursors.basic;
  }

  String get _hintText {
    switch (widget.type) {
      case AppInputType.search:
        return 'Selecione';
      // case AppInputType.cnpj:
      //   return AppMasks.cnpj;
      // case AppInputType.cpf:
      //   return AppMasks.cpf;
      // case AppInputType.date:
      //   return '00/00/0000';
      // case AppInputType.email:
      //   return 'exemplo@email.com';
      default:
        return widget.hint ?? '';
    }
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
      case AppInputType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.none;
    }
  }

  InputBorder get _border => widget.readOnly ? underlineBorder : outlinedBorder;

  OutlineInputBorder get outlinedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 0.6,
          color: color,
        ),
      );

  UnderlineInputBorder get underlineBorder => UnderlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 0.8,
          color: color,
        ),
      );

  Color get color {
    if (widget.readOnly) {
      return AppColors.grey[300]!;
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
    return isOpen.value ? AppColors.blue[700]! : AppColors.blue[500]!;
  }

  Color get iconBackgroundColor {
    if (widget.disable) {
      return AppColors.grey[300]!;
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
}
