import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String text;
  Color color;
  TitleText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: color),
    );
  }
}
