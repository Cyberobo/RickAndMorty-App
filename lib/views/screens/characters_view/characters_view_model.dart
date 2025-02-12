import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  CharactersModel? _charactersModel;

  CharactersModel? get charactersModel => _charactersModel;

  Future<void> getCharacters() async {
    _charactersModel = await _apiService.getAllCharacters();
    notifyListeners();
    log('geldi');
  }
}
