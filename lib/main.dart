import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';
import 'package:retroDownloader/app/modules/initial_page/initial_page_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Downloader',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: AppColors.background,
        body: InitialPage(),
      ),
    );
  }
}
