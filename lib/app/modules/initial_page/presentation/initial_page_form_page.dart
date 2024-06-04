import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/models/console_model.dart';
import 'package:retroDownloader/app/core/models/game_model.dart';
import 'package:retroDownloader/app/core/models/suggestion.dart';
import 'package:retroDownloader/app/shared/components/app_checkbox.dart';
import 'package:retroDownloader/app/shared/components/app_shimmer.dart';
import 'package:retroDownloader/app/shared/components/app_tab_skeleton.dart';
import 'package:retroDownloader/app/shared/components/app_table/app_table.dart';
import 'package:retroDownloader/app/shared/components/form/app_button/app_button.dart';
import 'package:retroDownloader/app/shared/components/form/app_button/app_button_style.dart';
import 'package:retroDownloader/app/shared/components/form/app_check_list/app_check_list.dart';
import 'package:retroDownloader/app/shared/components/form/app_field/app_field.dart';
import 'package:retroDownloader/app/shared/components/stream_out.dart';
import 'package:retroDownloader/app/shared/components/widget_form.dart';

import 'initial_page_controller.dart';
import 'initial_page_form.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final InitialPageController _controller = InitialPageController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamOut<InitialPageForm>(
      stream: _controller.formStream.listen,
      loading: const SizedBox(),
      child: (_, form) => AppTabSkeleton(
          padding: const EdgeInsets.only(top: 24, left: 8, right: 4, bottom: 24),
          children: [
            WidgetForm(
              columnLength: 1,
              child: consolesLoadingWidget(
                columnLenght: 6,
                child: (consoles) => AppCheckList<ConsoleModel>(
                  title: "Consoles",
                  controller: form!.console,
                  suggestions: consoles.map((e) => Suggestion<ConsoleModel>(e.name, e)).toList(),
                ),
              ),
            ),
            WidgetForm(
                columnLength: 4.5,
                child: AppTabSkeleton(children: [
                  loadingWidget(
                    columnLenght: 2,
                    child: (consoles) => AppField.search(
                      onSearchTap: () async => _controller.searchDownloadPath(),
                      columnLength: 2,
                      readOnly: true,
                      controller: form!.downloadPath,
                      hint: 'Caminho de download',
                      onChanged: (v) {},
                      onSubmitted: (v) async {},
                    ),
                  ),
                  loadingWidget(
                    columnLenght: 2,
                    child: (consoles) => AppField.text(
                      columnLength: 2,
                      controller: form!.gameName,
                      hint: 'Digite o nome do jogo',
                      onChanged: (v) => _controller.formStream.update(),
                      onSubmitted: (v) => _controller.searchGame(),
                    ),
                  ),
                  loadingWidget(
                    columnLenght: 1,
                    child: (consoles) => AppButton(
                      columnLength: 1,
                      label: 'Buscar',
                      onPressed: () => _controller.searchGame(),
                      style: AppButtonStyle.filled,
                    ),
                  ),
                  loadingWidget(
                    columnLenght: 1,
                    child: (games) => AppButton(
                      columnLength: 1,
                      label: 'Baixar',
                      enabled: form!.gameTable.allSelected,
                      onPressed: () => {},
                      style: AppButtonStyle.filled,
                    ),
                  ),
                  gamesLoadingWidget(
                    columnLenght: 6,
                    child: (games) => AppTable<Game>(
                      columnLenght: 4,
                      isCheckable: true,
                      headers: const [
                        'Sistema',
                        'Título',
                        'Região',
                        'Versão',
                      ],
                      cells: (game) => [
                        DataCell(Row(
                          children: [
                            AppCheckbox(
                                value: game.selected,
                                onChanged: (v) {
                                  game.selected = v ?? false;
                                  _controller.formStream.update();
                                }),
                            Text(game.system),
                          ],
                        )),
                        DataCell(Text(game.title)),
                        DataCell(Text(game.region)),
                        DataCell(Text(game.version)),
                      ],
                      controller: form!.gameTable,
                    ),
                  )
                ]))
          ]),
    );
  }

  Widget loadingWidget({
    required double columnLenght,
    required Widget Function(List<ConsoleModel>) child,
  }) {
    return StreamOut<List<ConsoleModel>>(
      stream: _controller.consoleStream.listen,
      columnLength: columnLenght,
      loading: AppShimmerField(
        columnLength: columnLenght,
      ),
      child: (_, consoles) => child.call(consoles!),
    );
  }

  Widget consolesLoadingWidget({
    required double columnLenght,
    required Widget Function(List<ConsoleModel>) child,
  }) {
    return StreamOut<List<ConsoleModel>>(
      stream: _controller.consoleStream.listen,
      columnLength: columnLenght,
      loading: AppShimmerTable(
        columnLength: columnLenght,
      ),
      child: (_, consoles) => child.call(consoles!),
    );
  }

  Widget gamesLoadingWidget({
    required double columnLenght,
    required Widget Function(List<Game>) child,
    Widget? loading,
  }) {
    return StreamOut<List<ConsoleModel>>(
      stream: _controller.consoleStream.listen,
      columnLength: columnLenght,
      loading: AppShimmerTable(
        columnLength: columnLenght,
      ),
      child: (_, consoles) => StreamOut<List<Game>>(
        stream: _controller.gamesStream.listen,
        columnLength: columnLenght,
        loading: loading ??
            AppShimmerTable(
              columnLength: columnLenght,
            ),
        child: (_, games) => child.call(games!),
      ),
    );
  }
}
