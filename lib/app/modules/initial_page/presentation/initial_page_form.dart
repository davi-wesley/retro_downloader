import 'package:retroDownloader/app/core/models/console_model.dart';
import 'package:retroDownloader/app/core/models/game_model.dart';
import 'package:retroDownloader/app/shared/components/app_table/app_table_controller.dart';
import 'package:retroDownloader/app/shared/components/form/app_check_list/dropdown_controller.dart';
import 'package:retroDownloader/app/shared/components/form/app_field/text_controller.dart';

class InitialPageForm {
  TextController gameName = TextController(text: '');
  TextController downloadPath = TextController(text: '');
  DropDownController<ConsoleModel> console = DropDownController<ConsoleModel>();
  AppTableController<Game> gameTable = AppTableController<Game>();
}
