class Game {
  String path = '';
  String title = '';
  String system = '';
  String region = '';
  String version = '';
  bool selected = false;

  Game();

  Game.mocked({
    required this.path,
    required this.title,
    required this.system,
    required this.region,
    required this.version,
  });

  Game.fromJson(Map<String, dynamic> json) {
    path = json["path"] ?? "";
    title = json["title"] ?? "";
    system = json["system"] ?? "";
    region = json["region"] ?? "";
    version = json["version"] ?? "";
  }

  Map<String, dynamic> toJson() => {
        "path": path,
        "title": title,
        "system": system,
        "region": region,
        "version": version,
      };

  static List<Game> getGames() {
    return [
      Game.mocked(
        path: 'caminho/para/o/jogo1',
        title: 'Jogo 1',
        system: 'Sistema 1',
        region: 'Região 1',
        version: 'Versão 1',
      ),
      Game.mocked(
        path: 'caminho/para/o/jogo2',
        title: 'Jogo 2',
        system: 'Sistema 2',
        region: 'Região 2',
        version: 'Versão 2',
      ),
      // Adicione mais jogos conforme necessário
    ];
  }
}
