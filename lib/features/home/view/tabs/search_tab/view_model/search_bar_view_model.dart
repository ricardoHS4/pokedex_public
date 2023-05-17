import 'package:dio/dio.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/services/api/api_service.dart';

class SearchBarViewModel {
  Future<PokemonModel?> searchPokemon(String query) async {
    try {
      Response response = await ApiService()
          .getHttp('https://pokeapi.co/api/v2/pokemon/$query');
      if (response.data['id'] == null) {
        return null;
      }
      PokemonModel pokemonModel = PokemonModel.fromJson(response.data);
      // Geting species data which contains the pokemon color that we will use on cards background
      Response responseSpecies =
          await ApiService().getHttp(pokemonModel.species['url']);
      pokemonModel.color = responseSpecies.data['color']['name'];
      return pokemonModel;
    } catch (e) {
      // If query is not successful, null is returned
      return null;
    }
  }
}
