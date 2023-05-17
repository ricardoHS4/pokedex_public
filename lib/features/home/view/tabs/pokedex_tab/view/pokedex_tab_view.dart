import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/texts/title_text.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/features/home/view/tabs/pokedex_tab/view/widgets/pokemon_table.dart';

class PokedexTabView extends StatelessWidget {
  const PokedexTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: AppStrings.pokedexTabTitle),
          const SizedBox(height: 20),
          const Expanded(child: PokemonTable()),
        ],
      ),
    );
  }
}
