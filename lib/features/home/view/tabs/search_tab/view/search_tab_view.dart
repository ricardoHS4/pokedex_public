import 'package:flutter/material.dart';
import 'package:pokedex_app/core/common_widgets/texts/title_text.dart';
import 'package:pokedex_app/core/constants/strings.dart';
import 'package:pokedex_app/features/home/view/tabs/search_tab/view/widgets/search_bar.dart';

class SearchTabView extends StatefulWidget {
  const SearchTabView({Key? key}) : super(key: key);

  @override
  _SearchTabViewState createState() => _SearchTabViewState();
}

class _SearchTabViewState extends State<SearchTabView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: AppStrings.searchTabLabel),
            const SizedBox(height: 20),
            SerachBar(controller: searchBarController),
          ],
        ),
      ),
    );
  }
}
