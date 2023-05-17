import 'package:flutter/material.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:pokedex_app/features/home/view/tabs/pokedex_tab/view/pokedex_tab_view.dart';
import 'package:pokedex_app/features/home/view/tabs/search_tab/view/search_tab_view.dart';
import 'package:pokedex_app/features/home/view/widgets/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabList = const [
      PokedexTabView(),
      SearchTabView(),
    ];

    return Consumer<AppStateProvider>(
        builder: (context, appStateSnapshot, child) {
      return Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(),
        body: tabList[appStateSnapshot.currentHomeTabIndex],
      );
    });
  }
}
