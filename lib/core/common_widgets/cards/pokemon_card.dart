import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/capitalize_string.dart';
import 'package:pokedex_app/core/common_functions/string_to_color.dart';
import 'package:pokedex_app/core/common_widgets/chips/type_chip.dart';
import 'package:pokedex_app/core/common_widgets/ui/pokeball_decoration.dart';
import 'package:pokedex_app/core/common_widgets/ui/pokemon_image.dart';
import 'package:pokedex_app/core/constants/colors.dart';
import 'package:pokedex_app/core/constants/routes_names.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  PokemonModel pokemonModel;
  PokemonCard({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = StringToColor(pokemonModel.color);

    return InkWell(
      onTap: () {
        Provider.of<AppStateProvider>(context, listen: false)
            .storePokemonModel(pokemonModel);
        Navigator.pushNamed(context, pokemonDetailsScreenRoute);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.only(left: 14, top: 24),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardLabel(pokemonModel.name),
                typeChips(pokemonModel),
              ],
            ),
          ),
          Positioned(
              right: -10, bottom: -6, child: PokeballDecoration(size: 110)),
          Positioned(
            right: 12,
            bottom: 12,
            child: PokemonImage(
                url: pokemonModel.mainImageUrl, heroTag: pokemonModel.name, size: 80),
          ),
        ],
      ),
    );
  }

  Widget cardLabel(String text) {
    return Text(
      capitalizeString(text),
      style: const TextStyle(
        fontSize: 20,
        color: PokemonColors.whiteTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget typeChips(PokemonModel pokemonModel) {
    List<Widget> chips = [];
    for (int x = 0; x < pokemonModel.types.length; x++) {
      chips.add(const SizedBox(height: 4));
      chips.add(TypeChip(label: pokemonModel.types[x]['type']['name']));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chips,
    );
  }
}
