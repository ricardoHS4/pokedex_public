class PokemonModel {
  late int id;
  late int base_experience;
  late int height;
  late String name;
  late int weight;
  late Map<String, dynamic> species;
  late Map<String, dynamic> sprites;
  late List<dynamic> stats;
  late List<dynamic> types;
  late String color;
  late String mainImageUrl;

  PokemonModel({
    this.height = -1,
    this.base_experience = -1,
    this.id = -1,
    this.name = "",
    this.weight = -1,
    this.species = const {},
    this.sprites = const {},
    this.stats = const [],
    this.types = const [],
    this.color = "",
    this.mainImageUrl = "",
  });

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    base_experience = json['base_experience'] ?? -1;
    height = json['height'] ?? -1;
    name = json['name'] ?? "";
    weight = json['weight'] ?? -1;
    species = json['species'];
    sprites = json['sprites'];
    stats = json['stats'];
    types = json['types'];
    mainImageUrl =
        json['sprites']['other']['official-artwork']['front_default'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'base_experience': base_experience,
        'height': height,
        'name': name,
        'weight': weight,
        'species': species,
        'sprites': sprites,
      };
}
