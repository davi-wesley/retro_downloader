import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/components/form/app_field/app_field.dart';
import 'package:retroDownloader/app/core/components/screen/app_form_skeleton.dart';
import 'package:retroDownloader/app/core/components/stream_out.dart';

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
      child: (_, form) => AppFormSkeleton(padding: const EdgeInsets.all(16), children: [
        AppField.text(
          columnLength: 6,
          controller: form.gameName,
          label: 'Nome do jogo',
          onChanged: (v) {},
        )
      ]),
    );
  }
}
