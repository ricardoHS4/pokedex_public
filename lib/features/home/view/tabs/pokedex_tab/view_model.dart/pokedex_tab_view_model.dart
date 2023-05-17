import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/cards/pokemon_card.dart';
import 'package:pokedex_app/core/model/pokemon_model.dart';
import 'package:pokedex_app/core/model/response_model.dart';
import 'package:pokedex_app/core/providers/pokedex_tab_provider.dart';
import 'package:pokedex_app/core/services/api/api_service.dart';
import 'package:provider/provider.dart';

class PokedexTabViewModel {
  /// Function that returns a single pokemon object from an url
  Future<PokemonModel> getPokemonFromUrl(String url) async {
    Response response = await ApiService().getHttp(url);
    PokemonModel pokemonModel = PokemonModel.fromJson(response.data);

    // Geting species data which contains the pokemon color that we will use on cards background
    Response responseSpecies =
        await ApiService().getHttp(pokemonModel.species['url']);
    pokemonModel.color = responseSpecies.data['color']['name'];
    return pokemonModel;
  }

  /// Function that returns a list of pokemon object from an url stored on the pokedex tab provider
  Future<List<PokemonModel>> getPokemonList(BuildContext context) async {
    PokedexTabProvider pokedexTabProvider =
        Provider.of<PokedexTabProvider>(context, listen: false);
    String url = pokedexTabProvider.currentUrl;
    Response response = await ApiService().getHttp(url);
    PokemonsBlockModel pokemonsBlockModel =
        PokemonsBlockModel.fromJson(response.data);

    //Store previous and next url so we can achieve pagination
    pokedexTabProvider.nextUrl = pokemonsBlockModel.next;
    pokedexTabProvider.prevUrl = pokemonsBlockModel.previous;

    List<dynamic> results = pokemonsBlockModel.results;
    List<PokemonModel> pokemonList = [];
    for (int x = 0; x < results.length; x++) {
      pokemonList.add(await getPokemonFromUrl(results[x]['url']));
    }
    return pokemonList;
  }

  List<Widget> getPokemonCardsFromList(List<PokemonModel> pokemonList) {
    List<Widget> cards = [];
    for (int x = 0; x < pokemonList.length; x++) {
      cards.add(PokemonCard(pokemonModel: pokemonList[x]));
    }
    return cards;
  }
}
