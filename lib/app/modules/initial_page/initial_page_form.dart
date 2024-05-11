import 'package:retroDownloader/app/core/components/form/app_field/text_controller.dart';
import 'package:retroDownloader/app/core/models/console_model.dart';

class InitialPageForm {
  TextController gameName = TextController(text: '');
  TextController<ConsoleModel> console = TextController<ConsoleModel>();
}
