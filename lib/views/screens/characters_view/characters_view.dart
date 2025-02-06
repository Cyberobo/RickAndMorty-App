import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'package:rickandmorty/views/widgets/characters_card_widget.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              _searchInputWidget(context),
              Consumer<CharactersViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.charactersModel == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    return Flexible(
                      child: ListView.builder(
                        itemCount: viewModel.charactersModel!.characters.length,
                        itemBuilder: (context, index) {
                          final characterModel =
                              viewModel.charactersModel!.characters[index];
                          return CharactersCardWidget(
                              characterModel: characterModel);
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: OutlineInputBorder(),
          label: Text('Search Character'),
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
