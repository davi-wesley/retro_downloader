class ConsoleModel {
  String path = '';
  String name = '';

  ConsoleModel(this.path, this.name);

  ConsoleModel.fromJson(Map<String, dynamic> json) {
    path = json["path"] ?? "";
    name = json["name"] ?? "";
  }

  Map<String, dynamic> toJson() => {
        "path": path,
        "name": name,
      };
}
