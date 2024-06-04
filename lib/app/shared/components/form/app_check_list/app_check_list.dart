import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/models/suggestion.dart';
import 'package:retroDownloader/app/shared/components/app_checkbox.dart';
import 'package:retroDownloader/app/shared/components/app_text.dart';
import 'package:retroDownloader/app/shared/components/app_title_box.dart';
import 'package:retroDownloader/app/shared/components/form/app_check_list/dropdown_controller.dart';
import 'package:retroDownloader/app/shared/components/stream_out.dart';
import 'package:retroDownloader/app/shared/components/utils/app_stream.dart';
import 'package:retroDownloader/app/shared/components/utils/w.dart';

class AppCheckList<T> extends StatefulWidget {
  final String? title;
  final DropDownController<T> controller;
  final List<Suggestion<T>> suggestions;
  final double columnLenght;
  const AppCheckList({
    super.key,
    required this.controller,
    required this.suggestions,
    this.columnLenght = 1,
    this.title,
  });

  @override
  _AppCheckListState<T> createState() => _AppCheckListState<T>();
}

class _AppCheckListState<T> extends State<AppCheckList<T>> {
  AppStream<List<Suggestion<T>>> suggestionsStream =
      AppStream<List<Suggestion<T>>>.seeded(<Suggestion<T>>[]);

  @override
  void initState() {
    super.initState();
    suggestionsStream.add(widget.suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return StreamOut<List<Suggestion<T>>>(
      columnLength: widget.columnLenght,
      stream: suggestionsStream.listen,
      child: (_, suggestions) => Container(
          height: MediaQuery.of(context).size.height - 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null)
                AppTitleBox(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                  widget.title!,
                ),
              Expanded(
                  child: ListView(
                children: [
                  for (Suggestion<T> suggestion in widget.suggestions) _itemList(suggestion),
                  const Spacer()
                ],
              ))
            ],
          )),
    );
  }

  Widget _itemList(Suggestion<T> suggestion) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCheckbox(
            value: suggestion.selected,
            onChanged: (v) {
              suggestion.selected = v!;
              suggestionsStream.update();
            }),
        const W(2),
        Expanded(child: AppText(suggestion.name))
      ],
    );
  }
}
