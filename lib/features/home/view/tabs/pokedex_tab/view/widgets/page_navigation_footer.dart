import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/texts/body_text.dart';
import 'package:pokedex_app/core/constants/colors.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/providers/pokedex_tab_provider.dart';
import 'package:provider/provider.dart';

class PageNavigationFooter extends StatelessWidget {
  const PageNavigationFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokedexTabProvider pokedexTabProvider =
        Provider.of<PokedexTabProvider>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          previousButton(context),
          nextButton(context),
        ],
      ),
    );
  }

  Widget previousButton(BuildContext context) {
    return InkWell(
      onTap: () {
        PokedexTabProvider pokedexTabProvider =
            Provider.of<PokedexTabProvider>(context, listen: false);
        if (pokedexTabProvider.prevUrl != null) {
          pokedexTabProvider.decreasePage();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back),
            BodyText(text: AppStrings.previousButtonLabel),
          ],
        ),
      ),
    );
  }

  Widget nextButton(BuildContext context) {
    return InkWell(
      onTap: () {
        PokedexTabProvider pokedexTabProvider =
            Provider.of<PokedexTabProvider>(context, listen: false);
        if (pokedexTabProvider.nextUrl != null) {
          pokedexTabProvider.increasePage();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            BodyText(text: AppStrings.nextButtonLabel),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
