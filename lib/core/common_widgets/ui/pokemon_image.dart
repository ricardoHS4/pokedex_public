import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  String url;
  String heroTag;
  double size;
  PokemonImage({Key? key, required this.url, required this.heroTag, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Image.network(
        url,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
