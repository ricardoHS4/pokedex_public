import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/string_is_numeric.dart';

bool stringIsInt(String s) {
  if (!stringIsNumeric(s)) {
    return false;
  }
  try {
    int i = int.parse(s);
    return true;
  } catch (e) {
    return false;
  }
}
