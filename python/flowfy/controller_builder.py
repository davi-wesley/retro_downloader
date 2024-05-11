
from build_utils import snake_to_pascal_case


class ControllerBuilder():
    def create_controller(flow_name : str, flow_dialog_type: str):
     name = snake_to_pascal_case(flow_name) + ('Dialog' if flow_dialog_type else '')
     value = f'''
import 'package:retroDownloader/app/core/components/utils/app_stream.dart';
import '{flow_name}{'_dialog' if flow_dialog_type == 'yes' else ''}_form.dart';

class {name}Controller {{
  static final {name}Controller _instance = {name}Controller._();
  {name}Controller._();
  factory {name}Controller() => _instance;

  AppStream<{name}Form> formStream = AppStream<{name}Form>();
  {name}Form get form => formStream.value;

  Future<void> init() async {{
    if (!formStream.hasValue) {{
      formStream.add({name}Form());
    }}
  }}

  void dispose() {{
   formStream.controller.close();
   formStream = AppStream<{name}Form>();
  }}
}}
'''
     return value

