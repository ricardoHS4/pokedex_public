import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/string_to_color.dart';
import 'package:pokedex_app/core/constants/colors.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class CustomFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  String? Function (String? value) validator;
  CustomFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonModel pokemonModel =
        Provider.of<AppStateProvider>(context, listen: false)
            .selectedPokemonModel!;
    Color color = StringToColor(pokemonModel.color);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(
                  color: PokemonColors.secondaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                // Blank validation is made to all fields
                if (value == "") {
                  return AppStrings.blankFormFieldErrorMessage;
                }
                return validator(value);
              },
              cursorColor: color,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    color: color,
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
        ],
      ),
    );
  }
}
