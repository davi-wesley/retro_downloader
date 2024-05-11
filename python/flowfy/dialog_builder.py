
from build_utils import snake_to_pascal_case


class DialogBuilder():
    def create_dialog(flow_name : str):
     name = snake_to_pascal_case(flow_name)
     value = f'''
import 'package:customerfy/app/core/components/app_button.dart';
import 'package:customerfy/app/core/components/app_dialog.dart';
import 'package:customerfy/app/core/components/form/app_dialog_skeleton.dart';
import 'package:customerfy/app/core/enums/app_button_style.dart';
import 'package:customerfy/app/core/utils/global_resources.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:customerfy/app/core/components/stream_out.dart';
import 'geracao_lote_ncob_dialog_form.dart';
import '{flow_name}_dialog_controller.dart';

class {name}Dialog extends StatefulWidget {{
  const {name}Dialog({{super.key}});

  @override
  State<{name}Dialog> createState() => _{name}DialogState();
}}

class _{name}DialogState extends State<{name}Dialog> {{
  final {name}DialogController _controller = {name}DialogController();

   @override
  void initState() {{
    _controller.init();
    super.initState();
  }}

  @override
  void dispose() {{
    _controller.dispose();
    super.dispose();
  }}

  @override
  Widget build(BuildContext context) {{
    return StreamOut<{name}DialogForm>(
      stream: _controller.formStream.listen,
      child: (_, form) => AppDialog(
      width: 400,
      title: '',
      child: AppDialogSkeleton(
        children: [],
      ),
    ),);
  }}
}}
'''
     return value

