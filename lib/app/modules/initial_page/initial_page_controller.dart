import 'package:retroDownloader/app/core/components/utils/app_stream.dart';
import 'initial_page_form.dart';

class InitialPageController {
  static final InitialPageController _instance = InitialPageController._();
  InitialPageController._();
  factory InitialPageController() => _instance;

  AppStream<InitialPageForm> formStream = AppStream<InitialPageForm>();
  InitialPageForm get form => formStream.value;

  Future<void> init() async {
    if (!formStream.hasValue) {
      formStream.add(InitialPageForm());
    }
  }

  void dispose() {
    formStream.controller.close();
    formStream = AppStream<InitialPageForm>();
  }
}
