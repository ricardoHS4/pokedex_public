import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/capitalize_string.dart';
import 'package:pokedex_app/core/common_functions/format_id.dart';
import 'package:pokedex_app/core/common_widgets/chips/type_chip.dart';
import 'package:pokedex_app/core/common_widgets/texts/subtitle_text.dart';
import 'package:pokedex_app/core/common_widgets/texts/title_text.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonModel pokemonModel =
        Provider.of<AppStateProvider>(context, listen: false)
            .selectedPokemonModel!;

    List<Widget> chips = [];
    for (int x = 0; x < pokemonModel.types.length; x++) {
      chips.add(TypeChip(label: pokemonModel.types[x]['type']['name']));
    }
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(text: capitalizeString(pokemonModel.name), color: Colors.white),
                const SizedBox(height: 10),
                Wrap(children: chips, spacing: 6)
              ],
            ),
          ),
          SubtitleText(text: formatId(pokemonModel.id), color: Colors.white)
        ],
      ),
    );
  }
}
