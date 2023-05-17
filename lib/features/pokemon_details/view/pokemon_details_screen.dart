import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/string_to_color.dart';
import 'package:pokedex_app/core/common_widgets/ui/pokeball_decoration.dart';
import 'package:pokedex_app/core/common_widgets/ui/pokemon_image.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:pokedex_app/features/pokemon_details/view/widgets/details_form.dart';
import 'package:pokedex_app/features/pokemon_details/view/widgets/details_header.dart';
import 'package:pokedex_app/features/pokemon_details/view/widgets/return_button.dart';
import 'package:provider/provider.dart';

class PokemonDetailsScreen extends StatefulWidget {
  static const String id = '/pokemon_details';
  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    PokemonModel pokemonModel =
        Provider.of<AppStateProvider>(context, listen: false)
            .selectedPokemonModel!;

    return Scaffold(
      backgroundColor: StringToColor(pokemonModel.color),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned(top: 60, left: 20, child: ReturnButton()),
          const DetailsHeader(),
          Positioned(
              right: -30, top: 210, child: PokeballDecoration(size: 200)),
          Column(
            children: const [
              SizedBox(height: 360),
              Expanded(child: DetailsForm()),
            ],
          ),
          Positioned(
            top: 200,
            child: PokemonImage(
              url: pokemonModel.mainImageUrl,
              heroTag: pokemonModel.name,
              size: 200,
            ),
          )
        ],
      ),
    );
  }
}
