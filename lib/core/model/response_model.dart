
class PokemonsBlockModel {
  late int count;
  late String? next;
  late String? previous;
  late List<dynamic> results;

  PokemonsBlockModel({
    this.count = -1,
    this.next = "",
    this.previous = "",
    this.results = const [],

  });

  PokemonsBlockModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results,
      };
}
