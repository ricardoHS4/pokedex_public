import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  String text;
  Color color;
  BodyText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: color),
    );
  }
}
