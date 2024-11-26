class Pokemon {
  final String name;
  final String sprite;
  final List<String> types;

  Pokemon({
    required this.name,
    required this.sprite,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      sprite: json['sprites']['front_default'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
    );
  }
}
