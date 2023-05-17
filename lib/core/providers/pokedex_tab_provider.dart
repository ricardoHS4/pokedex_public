import 'package:flutter/material.dart';

class PokedexTabProvider extends ChangeNotifier {
  String currentUrl = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20";
  String? nextUrl;
  String? prevUrl;

  void increasePage() {
    if (nextUrl != null) {
      currentUrl = nextUrl!;
      notifyListeners();
    }
  }

  void decreasePage() {
    if (prevUrl != null) {
      currentUrl = prevUrl!;
      notifyListeners();
    }
  }

  void updateState() {
    notifyListeners();
  }
}
