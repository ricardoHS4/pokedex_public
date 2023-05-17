import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/routes_names.dart';
import 'package:pokedex_app/features/home/view/home_screen.dart';
import 'package:pokedex_app/features/pokemon_details/view/pokemon_details_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print(settings.name);
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case pokemonDetailsScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const PokemonDetailsScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => const Text('no route selected'));
  }
}
