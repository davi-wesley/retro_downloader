import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:retroDownloader/app/shared/components/app_checkbox.dart';
import 'package:retroDownloader/app/shared/components/app_table/app_table_controller.dart';
import 'package:retroDownloader/app/shared/components/app_table/app_table_register.dart';
import 'package:retroDownloader/app/shared/components/app_text.dart';
import 'package:retroDownloader/app/shared/components/stream_out.dart';
import 'package:retroDownloader/app/shared/components/utils/app_stream.dart';

class AppTable<T> extends StatefulWidget {
  final bool? isCheckable;
  final List<String> headers;
  final List<DataCell> Function(T) cells;
  final AppTableController<T> controller;
  final double columnLenght;

  const AppTable({
    super.key,
    this.isCheckable,
    required this.headers,
    required this.cells,
    required this.controller,
    this.columnLenght = 1,
  });

  @override
  State<AppTable<T>> createState() => _AppTableState<T>();
}

class _AppTableState<T> extends State<AppTable<T>> {
  AppStream<bool> allSelected = AppStream<bool>.seeded(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamOut<List<AppTableRegister<T>>>(
        stream: widget.controller.dataRegistersStream.listen,
        child: (_, registers) => SizedBox(
              height: MediaQuery.of(context).size.height - 110,
              width: widget.columnLenght * (MediaQuery.of(context).size.width / 6.5) +
                  ((widget.columnLenght - 1) * 8),
              child: DataTable2(
                showHeadingCheckBox: true,
                showBottomBorder: true,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                horizontalMargin: 12,
                minWidth: 2,
                columns: [
                  DataColumn2(
                    label: Row(
                      children: [
                        if (widget.isCheckable ?? false)
                          StreamOut<bool>(
                            stream: widget.controller.checkAllStream.listen,
                            child: (_, allChecked) => AppCheckbox(
                              value: allChecked ?? false,
                              onChanged: (v) {
                                widget.controller.checkAllStream.add(v ?? false);
                                widget.controller.selectAll(v ?? false);
                              },
                            ),
                          ),
                        Expanded(child: AppText(widget.headers[0]))
                      ],
                    ),
                  ),
                  for (int i = 1; i < widget.headers.length; i++)
                    DataColumn2(
                      label: Row(
                        children: [Expanded(child: AppText(widget.headers[i]))],
                      ),
                    )
                ],
                rows: List<DataRow>.generate(
                  registers!.length,
                  (index) => DataRow(cells: widget.cells.call(registers[index].dataRegister)),
                ),
              ),
            ));
  }
}
