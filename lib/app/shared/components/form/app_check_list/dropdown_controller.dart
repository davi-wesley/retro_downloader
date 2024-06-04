import 'package:retroDownloader/app/core/models/suggestion.dart';

class DropDownController<T> {
  late List<Suggestion<T>> objects;

  DropDownController();

  List<Suggestion<T>> get selectedItems => objects.where((e) => e.selected).toList();
}
