import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/colors.dart';

Color StringToColor(String stringColor) {
  Color color = PokemonColors.whiteColor;
  switch (stringColor) {
    case 'black':
      color = PokemonColors.blackColor;
      break;
    case 'blue':
      color = PokemonColors.blueColor;
      break;
    case 'brown':
      color = PokemonColors.brownColor;
      break;
    case 'gray':
      color = PokemonColors.grayColor;
      break;
    case 'green':
      color = PokemonColors.greenColor;
      break;
    case 'pink':
      color = PokemonColors.pinkColor;
      break;
    case 'purple':
      color = PokemonColors.purpleColor;
      break;
    case 'red':
      color = PokemonColors.redColor;
      break;
    case 'white':
      color = PokemonColors.whiteColor;
      break;
    case 'yellow':
      color = PokemonColors.yellowColor;
      break;
  }
  return color;
}
