import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  String errorMessage = "";

  void updateErrorMessage(String error) {
    errorMessage = error;
    notifyListeners();
  }
  void clearErrorMessage() {
    errorMessage = "";
    notifyListeners();
  }
}
