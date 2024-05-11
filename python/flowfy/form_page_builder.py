
from build_utils import snake_to_pascal_case


class FormPageBuilder():
    def create_form_page(flow_name : str):
     name = snake_to_pascal_case(flow_name)


     #lib/app/core/global_resources.dart
     value = f'''
import 'package:retroDownloader/app/core/components/app_button.dart';
import 'package:retroDownloader/app/core/components/app_shimmer.dart';
import 'package:retroDownloader/app/core/components/app_title_box.dart';
import 'package:retroDownloader/app/core/components/form/app_field.dart';
import 'package:retroDownloader/app/core/components/form/app_tab_skeleton.dart';
import 'package:retroDownloader/app/core/components/stream_out.dart';
import 'package:retroDownloader/app/core/components/table/ui/app_table.dart';
import 'package:retroDownloader/app/core/enums/app_button_style.dart';
import 'package:retroDownloader/app/core/utils/global_resources.dart';
import 'package:flutter/material.dart';
import '{flow_name}_form.dart';
import '{flow_name}_controller.dart';

class {name}FormPage extends StatefulWidget {{
  const {name}FormPage({{Key? key}}) : super(key: key);

  @override
  State<{name}FormPage> createState() => _{name}FormPageState();
}}

class _{name}FormPageState extends State<{name}FormPage> {{
  final {name}Controller _controller = {name}Controller();

  @override
  void initState() {{
    _controller.init();
    super.initState();
  }}

  @override
  Widget build(BuildContext context) {{
    return StreamOut<{name}Form>(
      stream: _controller.formStream.listen,
      loading: const SizedBox(),
      child: (_, form) => AppTabSkeleton(
        children: []
      ),
    );
  }}
}}

'''
     return value

