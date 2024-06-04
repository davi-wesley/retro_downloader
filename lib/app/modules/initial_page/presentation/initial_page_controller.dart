import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:retroDownloader/app/core/models/console_model.dart';
import 'package:retroDownloader/app/core/models/game_model.dart';
import 'package:retroDownloader/app/shared/components/utils/app_stream.dart';

import 'initial_page_form.dart';

class InitialPageController {
  static final InitialPageController _instance = InitialPageController._();
  InitialPageController._();
  factory InitialPageController() => _instance;

  AppStream<InitialPageForm> formStream = AppStream<InitialPageForm>();
  AppStream<List<ConsoleModel>> consoleStream = AppStream<List<ConsoleModel>>();
  AppStream<List<Game>> gamesStream = AppStream<List<Game>>.seeded(<Game>[]);
  InitialPageForm get form => formStream.value!;

  Future<void> init() async {
    if (!formStream.hasValue) {
      formStream.add(InitialPageForm());
      getConsoles();
    }
  }

  Future<void> getConsoles() async {
    var script = 'python\\consoles_list.py';
    var process = await Process.start('python', [script]);
    process.stdout.transform(utf8.decoder).listen((output) {
      log(output);
    }).onDone(() async {
      final file = File('python\\consoles.json');
      final jsonStr = await file.readAsString();
      List<dynamic> jsonMap = json.decode(jsonStr);
      List<ConsoleModel> consoles = jsonMap.map((e) => ConsoleModel.fromJson(e)).toList();
      consoleStream.add(consoles);
    });
  }

  Future<void> getGamesByName(String name) async {
    var script = 'python\\games_list.py';
    var process = await Process.start('python', [script, name]);
    process.stdout.transform(utf8.decoder).listen((output) {
      log(output);
    }).onDone(() async {
      final file = File('python\\games.json');
      final jsonStr = await file.readAsString();
      List<dynamic> jsonMap = json.decode(jsonStr);
      List<Game> games = jsonMap.map((e) => Game.fromJson(e)).toList();
      if (games.isEmpty) {
        gamesStream.setDefault();
        return;
      }
      gamesStream.add(games);
      formStream.value!.gameTable.addRegisters(gamesStream.value ?? <Game>[]);
    });
  }

  Future<void> searchDownloadPath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      form.downloadPath.setValue(selectedDirectory);
      formStream.update();
    }
  }

  void checkAllGames(bool checked) {
    for (Game game in gamesStream.value ?? []) {
      game.selected = checked;
    }
    gamesStream.update();
  }

  Future<void> searchGame() async {
    gamesStream.setLoading();
    await getGamesByName(formStream.value?.gameName.value ?? '');
    formStream.update();
  }

  void dispose() {
    formStream.controller.close();
    formStream = AppStream<InitialPageForm>();
  }
}
