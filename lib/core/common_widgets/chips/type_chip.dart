import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/colors.dart';

class TypeChip extends StatelessWidget {
  String label;
  TypeChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: PokemonColors.textBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(color: PokemonColors.whiteTextColor)),
    );

  }
}
