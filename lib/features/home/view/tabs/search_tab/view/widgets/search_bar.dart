import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/texts/body_text.dart';
import 'package:pokedex_app/core/constants/colors.dart';
import 'package:pokedex_app/core/constants/routes_names.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:pokedex_app/core/providers/search_bar_provider.dart';
import 'package:pokedex_app/features/home/view/tabs/search_tab/view_model/search_bar_view_model.dart';
import 'package:provider/provider.dart';

class SerachBar extends StatelessWidget {
  TextEditingController controller;
  SerachBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBarProvider>(
        builder: (context, searchBarSnapshot, child) {
      return Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                errorText: searchBarSnapshot.errorMessage == ""
                    ? null
                    : searchBarSnapshot.errorMessage,
                hintText: AppStrings.searchBarHintText,
                hintStyle:
                    const TextStyle(color: PokemonColors.secondaryTextColor),
                suffixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    color: PokemonColors.blueColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    color: PokemonColors.secondaryTextColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () async {
              PokemonModel? pokemonModel =
                  await SearchBarViewModel().searchPokemon(controller.text);
              if (pokemonModel == null) {
                Provider.of<SearchBarProvider>(context, listen: false)
                    .updateErrorMessage(AppStrings.unvalidSearchErrorMessage);
              } else {
                Provider.of<SearchBarProvider>(context, listen: false)
                    .clearErrorMessage();
                Provider.of<AppStateProvider>(context, listen: false)
                    .storePokemonModel(pokemonModel);
                Navigator.pushNamed(context, pokemonDetailsScreenRoute);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: BodyText(
                text: AppStrings.searchButtonLabel, color: Colors.white),
          )
        ],
      );
    });
  }
}
