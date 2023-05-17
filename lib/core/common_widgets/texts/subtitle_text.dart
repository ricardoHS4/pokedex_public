import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  String text;
  Color color;
  SubtitleText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
    );
  }
}
