import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/colors.dart';

class PokeballDecoration extends StatelessWidget {
  double size;
  PokeballDecoration({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.catching_pokemon,
      color: PokemonColors.textBackgroundColor,
      size: size,
    );
  }
}
