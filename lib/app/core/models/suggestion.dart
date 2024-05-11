class Suggestion<T> {
  final String name;
  final T object;
  bool selected = false;
  Suggestion(this.name, this.object);

  @override
  String toString() => 'Suggestion(name: $name, object: ${object.toString()})';
}

class SuggestionPersonalizado<T> {
  final String name;
  final String label;
  final T object;
  bool selected = false;
  SuggestionPersonalizado(this.name, this.object, this.label);

  @override
  String toString() => 'Suggestion(name: $name, object: ${object.toString()})';
}
