import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/colors.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
const CustomBottomNavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Consumer<AppStateProvider>(
      builder: (context, appStateSnapshot, child) {
        return BottomNavigationBar(
          currentIndex: appStateSnapshot.currentHomeTabIndex,
          onTap: (value) => Provider.of<AppStateProvider>(context, listen: false).updateHomeTab(value),
          selectedItemColor: PokemonColors.primaryColor,
          
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.catching_pokemon),label: AppStrings.pokedexTabLabel),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: AppStrings.searchTabLabel),
          ],
        );
      }
    );
  }
}