import 'package:flutter/material.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';

class AppStateProvider extends ChangeNotifier {
  int currentHomeTabIndex = 0;
  PokemonModel? selectedPokemonModel;

  void updateHomeTab(int selectedTab) {
    currentHomeTabIndex = selectedTab;
    notifyListeners();
  }

  void storePokemonModel(PokemonModel pokemonModel) {
    selectedPokemonModel = pokemonModel;
  }

  void clearPokemonModel() {
    selectedPokemonModel = null;
  }
}
