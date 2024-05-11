import 'package:field_suggestion/box_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:retroDownloader/app/core/components/enums/text_controller_type.dart';
import 'package:retroDownloader/app/core/models/console_model.dart';
import 'package:retroDownloader/app/core/models/suggestion.dart';

class TextController<T> {
  UniqueKey autoCompleteKey = UniqueKey();
  late dynamic controller;
  String get value => controller.value.text;
  bool get isSelected => object != null;
  void dispose() => controller.dispose();
  bool hasFocus = false;
  bool hasHover = false;
  bool hasError = false;
  bool isOpen = false;
  FocusNode focus = FocusNode();
  T? object;
  T? lastObject;
  BoxController boxController = BoxController();
  TextControllerType type;
  List<ConsoleModel> objectsPrivate = [];
  final GlobalKey key = GlobalKey();

  void clear() {
    // if (type == TextControllerType.currency) {
    //   controller.text = translate.zeroDinheiro;
    // } else {
    //   controller.text = '';
    // }
    controller.text = '';
    lastObject = object;
    object = null;
    boxController.close?.call();
  }

  void setValue(text) {
    try {
      // if (type == TextControllerType.currency) {
      //   text = toMoney(text != null ? double.parse(text.toString()) : 0);
      // }
      controller.text = text.toString();
      boxController.close?.call();
    } catch (_) {}
  }

  void setObject([int? id, String? descr, String? flag]) {
    try {
      controller.text = descr ?? '';
      //object = DefaultModel(id: id ?? 0, descr: descr ?? '', flag: flag ?? '') as T;
      boxController.refresh?.call();
      boxController.close?.call();
    } catch (_) {}
  }

  void setObjectStr([String? id, String? descr, String? flag]) {
    try {
      controller.text = descr ?? '';
      //object = DefaultModel(idStr: id ?? '', descr: descr ?? '', flag: flag ?? '') as T;
      boxController.refresh?.call();
      boxController.close?.call();
    } catch (_) {}
  }

  // void setObjectByFlag(String flag, List<DefaultModel> objects) {
  //   try {
  //     DefaultModel defaultModel = objects.firstWhere((e) => e.flag == flag);
  //     controller.text = defaultModel.descr;
  //     object = defaultModel as T;
  //     boxController.refresh?.call();
  //     boxController.close?.call();
  //   } catch (_) {}
  // }

  // void setObjetByList(List<dynamic> values, int id) {
  //   DefaultModel defaultModel = DefaultModel();
  //   if (values.isNotEmpty) {
  //     try {
  //       defaultModel = values.firstWhere((e) => e.codigo == id);
  //     } catch (_) {}
  //   }
  //   object = defaultModel as T;
  //   controller.text = defaultModel.descr;
  //   boxController.refresh?.call();
  //   boxController.close?.call();
  // }

  // int getId() {
  //   try {
  //     if (object is DefaultModel) {
  //       return (object as DefaultModel).id;
  //     } else {
  //       return 0;
  //     }
  //   } catch (e) {
  //     return 0;
  //   }
  // }

  // String getIdStr() {
  //   if (object is DefaultModel) {
  //     return (object as DefaultModel).idStr;
  //   } else {
  //     return '';
  //   }
  // }

  //int idFromObject() => object.id as int;

  bool get hasObject => object != null;
  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  // int get intValue {
  //   try {
  //     final v = value.isEmpty ? '0' : value;
  //     switch (type) {
  //       case TextControllerType.currency:
  //         return int.parse(
  //           value
  //               .replaceAll(CurrencyService.current.symbol, empty)
  //               .replaceAll('.', empty)
  //               .replaceAll(',', '.')
  //               .replaceAll(' ', empty)
  //               .replaceAll(' ', empty)
  //               .trim(),
  //         );
  //       case TextControllerType.number:
  //         return int.parse(v);
  //       case TextControllerType.double:
  //         return int.parse(v);
  //       default:
  //         return int.tryParse(v) ?? 0;
  //     }
  //   } catch (e) {
  //     return 0;
  //   }
  // }

  // double get doubleValue {
  //   try {
  //     final v = value.isEmpty ? '0' : value;
  //     switch (type) {
  //       case TextControllerType.currency:
  //         return double.parse(
  //           value
  //               .replaceAll(CurrencyService.current.symbol, empty)
  //               .replaceAll('.', empty)
  //               .replaceAll(',', '.')
  //               .replaceAll(' ', empty)
  //               .replaceAll(' ', empty)
  //               .trim(),
  //         );
  //       case TextControllerType.number:
  //         return double.parse(v);
  //       case TextControllerType.double:
  //         return double.parse(v);
  //       default:
  //         return double.tryParse(v) ?? 0.0;
  //     }
  //   } catch (e) {
  //     return 0.0;
  //   }
  // }

  // String dateApiFormatted({String? format, bool slash = true}) {
  //   try {
  //     format ??= 'dd/MM/yyyy';
  //     if (!slash) format = format.replaceAll('/', empty);
  //     final dateFormat = DateFormat(format);
  //     switch (type) {
  //       case TextControllerType.date:
  //         return dateFormat.format(DateFormat('dd/MM/yyyy').parse(value));
  //       default:
  //         return value;
  //     }
  //   } catch (e) {
  //     return empty;
  //   }
  // }

  // String dateApiFormattedAmerican({String? format, bool slash = true}) {
  //   try {
  //     format ??= 'yyyy-MM-dd';
  //     if (!slash) format = format.replaceAll('/', empty);
  //     final dateFormat = DateFormat(format);
  //     switch (type) {
  //       case TextControllerType.date:
  //         return dateFormat.format(DateFormat('yyyy-MM-dd').parse(value));
  //       default:
  //         return value;
  //     }
  //   } catch (e) {
  //     return empty;
  //   }
  // }

  // bool hasValidDate({
  //   String? format,
  //   bool slash = true,
  //   bool onlyFuture = false,
  //   bool nowAndFuture = false,
  // }) {
  //   try {
  //     format ??= 'dd/MM/yyyy';
  //     if (!slash) format = format.replaceAll('/', empty);
  //     final dateFormat = DateFormat(format);
  //     final date = dateFormat.parse(value);
  //     final now = DateTime(
  //       DateTime.now().year,
  //       DateTime.now().month,
  //       DateTime.now().day,
  //     );
  //     if (onlyFuture) {
  //       return !date.isBefore(now);
  //     }
  //     if (nowAndFuture) {
  //       return date.isAfter(now) || date.isAtSameMomentAs(now);
  //     }
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  TextController({
    dynamic text,
    String? mask,
    this.type = TextControllerType.text,
    this.object,
    int? id,
  }) {
    controller = TextEditingController(text: text.toString());
    // if (text == null) {
    //   text = '';
    //   if (type == TextControllerType.number) {
    //     // text = 0;
    //   } else if (type == TextControllerType.double) {
    //     // text = 0;
    //   } else if (type == TextControllerType.currency) {
    //     CurrencyService.update();
    //     if (CurrencyService.current.name != 'Euro') {
    //       text = '${CurrencyService.current.symbol} 0,00';
    //     } else {
    //       text = '0,00 ${CurrencyService.current.symbol}';
    //     }
    //   }
    // }
    // controller = mask != null
    //     ? MaskedTextController(mask: mask, text: text.toString())
    //     : TextEditingController(text: text.toString());
    // if (id != null && T is DefaultModel) {
    //   object = DefaultModel(id: id, descr: text.toString()) as T;
    // }
  }

  // DefaultModelTextController<T> get defaultModel => DefaultModelTextController<T>(object);

  void close() {
    boxController.close?.call();
  }

  map(Suggestion Function(dynamic e) param0) {}
}

// class DefaultModelTextController<T> {
//   T? object;
//   DefaultModelTextController(this.object);
//   int get id {
//     if (object == null) return 0;
//     if (object is! DefaultModel) return 0;
//     return (object as DefaultModel).id;
//   }

//   String get descr {
//     if (object == null) return '';
//     if (object is! DefaultModel) return '';
//     return (object as DefaultModel).descr;
//   }

//   String get flag {
//     if (object == null) return '';
//     if (object is! DefaultModel) return '';
//     return (object as DefaultModel).flag;
//   }
// }
