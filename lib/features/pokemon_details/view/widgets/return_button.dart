import 'package:flutter/material.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Provider.of<AppStateProvider>(context, listen: false)
            .clearPokemonModel();
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.white),
    );
  }
}
