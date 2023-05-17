import 'package:intl/intl.dart';


String formatId(int id) {
  var formatter = NumberFormat('000');
  return "#${formatter.format(id)}";
}