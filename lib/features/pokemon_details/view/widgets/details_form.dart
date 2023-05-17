import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_functions/capitalize_string.dart';
import 'package:pokedex_app/core/common_functions/string_is_int.dart';
import 'package:pokedex_app/core/common_functions/string_to_color.dart';
import 'package:pokedex_app/core/common_widgets/texts/body_text.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:pokedex_app/features/pokemon_details/view/widgets/custom_form_field.dart';
import 'package:provider/provider.dart';

class DetailsForm extends StatefulWidget {
  const DetailsForm({Key? key}) : super(key: key);

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController baseExpController = TextEditingController();
  List<TextEditingController> statControllers = [];
  PokemonModel pokemonModel = PokemonModel();
  List<Widget> formFields = [];

  @override
  void initState() {
    pokemonModel = Provider.of<AppStateProvider>(context, listen: false)
        .selectedPokemonModel!;

    // Initialize form controllers
    heightController.text = pokemonModel.height.toString();
    weightController.text = pokemonModel.weight.toString();
    baseExpController.text = pokemonModel.base_experience.toString();
    for (int x = 0; x < pokemonModel.stats.length; x++) {
      var stat = pokemonModel.stats[x];
      statControllers
          .add(TextEditingController(text: stat['base_stat'].toString()));
      print(statControllers[x].text);
    }

    for (int x = 0; x < statControllers.length; x++) {
      print(statControllers[x].text);
    }

    // Generate form fields
    formFields = [];
    formFields.add(
      CustomFormField(
        label: AppStrings.heightFormFieldLabel,
        controller: heightController,
        validator: (value) {
          if (!stringIsInt(value!)) {
            return AppStrings.notIntFormFieldErrorMessage;
          }
          return null;
        },
      ),
    );

    formFields.add(
      CustomFormField(
        label: AppStrings.weightFormFieldLabel,
        controller: weightController,
        validator: (value) {
          if (!stringIsInt(value!)) {
            return AppStrings.notIntFormFieldErrorMessage;
          }
          return null;
        },
      ),
    );

    formFields.add(
      CustomFormField(
        label: AppStrings.baseExperienceFormFieldLabel,
        controller: baseExpController,
        validator: (value) {
          if (!stringIsInt(value!)) {
            return AppStrings.notIntFormFieldErrorMessage;
          }
          return null;
        },
      ),
    );

    for (int x = 0; x < pokemonModel.stats.length; x++) {
      var stat = pokemonModel.stats[x];
      formFields.add(
        CustomFormField(
          label: capitalizeString(stat['stat']['name']),
          controller: statControllers[x],
          validator: (value) {
            if (!stringIsInt(value!)) {
              return AppStrings.notIntFormFieldErrorMessage;
            }
            return null;
          },
        ),
      );
    }

    formFields.add(validateButton());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: formFields,
          ),
        ),
      ),
    );
  }

  Widget validateButton() {
    PokemonModel pokemonModel =
        Provider.of<AppStateProvider>(context, listen: false)
            .selectedPokemonModel!;
    Color color = StringToColor(pokemonModel.color);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppStrings.correctValidationMessage)),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: BodyText(
            text: AppStrings.validateButtonLabel,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
