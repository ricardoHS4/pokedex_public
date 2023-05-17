import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/routes_names.dart';
import 'package:pokedex_app/core/providers/app_state_provider.dart';
import 'package:pokedex_app/core/providers/pokedex_tab_provider.dart';
import 'package:pokedex_app/core/providers/search_bar_provider.dart';
import 'package:pokedex_app/core/routes/routes.dart' as router;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(
            create: (_) => AppStateProvider()),
        ChangeNotifierProvider<PokedexTabProvider>(
            create: (_) => PokedexTabProvider()),
        ChangeNotifierProvider<SearchBarProvider>(
            create: (_) => SearchBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router.generateRoute,
        initialRoute: homeScreenRoute,
      ),
    );
  }
}
