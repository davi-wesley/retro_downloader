import 'package:retroDownloader/app/shared/components/app_table/app_table_register.dart';
import 'package:retroDownloader/app/shared/components/utils/app_stream.dart';

class AppTableController<T> {
  final AppStream<List<AppTableRegister<T>>> dataRegistersStream =
      AppStream<List<AppTableRegister<T>>>.seeded(<AppTableRegister<T>>[]);

  AppTableController();

  void addRegisters(List<T> dataRegisters) {
    List<AppTableRegister<T>> registers =
        dataRegisters.map((e) => AppTableRegister<T>(dataRegister: e)).toList();
    dataRegistersStream.add(registers);
  }

  AppStream<bool> checkAllStream = AppStream<bool>.seeded(false);

  List<AppTableRegister<T>> get checkedRegisters =>
      dataRegistersStream.value!.where((e) => e.selected).toList();

  void selectAll(bool check) {
    for (AppTableRegister<T> value in dataRegistersStream.value ?? []) {
      value.selected = check;
    }
    dataRegistersStream.update();
  }

  bool get allSelected =>
      dataRegistersStream.value!.isNotEmpty &&
      dataRegistersStream.value!.where((e) => e.selected).length ==
          dataRegistersStream.value!.length;
}
