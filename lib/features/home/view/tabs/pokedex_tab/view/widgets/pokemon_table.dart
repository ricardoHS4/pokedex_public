import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/cards/pokemon_card.dart';
import 'package:pokedex_app/core/providers/pokedex_tab_provider.dart';
import 'package:pokedex_app/features/home/view/tabs/pokedex_tab/view/widgets/page_navigation_footer.dart';
import 'package:pokedex_app/features/home/view/tabs/pokedex_tab/view_model.dart/pokedex_tab_view_model.dart';
import 'package:provider/provider.dart';

class PokemonTable extends StatelessWidget {
  const PokemonTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokedexTabProvider>(
        builder: (context, pokedexTabSnapshot, child) {
      // Getting screen width so we can adjust the number of pokemon cards per row
      int width = MediaQuery.of(context).size.width.round();
      return Stack(
        children: [
          FutureBuilder(
            future: PokedexTabViewModel().getPokemonList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (width / 180).round(),
                      childAspectRatio: 5 / 4),
                  padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 60),
                  children: PokedexTabViewModel()
                      .getPokemonCardsFromList(snapshot.data!),
                );
              }
            },
          ),
          const Positioned(bottom: 0, child: PageNavigationFooter()),
        ],
      );
    });
  }
}
