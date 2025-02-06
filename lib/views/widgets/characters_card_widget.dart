import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';

class CharactersCardWidget extends StatelessWidget {
  final CharacterModel characterModel;

  const CharactersCardWidget({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    characterModel.image,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        characterModel.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _infoCardWidget(
                          type: 'Köken', value: characterModel.origin.name),
                      SizedBox(
                        height: 4,
                      ),
                      _infoCardWidget(
                          type: 'Durum',
                          value:
                              '${characterModel.status} - ${characterModel.species}')
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border))
        ],
      ),
    );
  }

  Column _infoCardWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
