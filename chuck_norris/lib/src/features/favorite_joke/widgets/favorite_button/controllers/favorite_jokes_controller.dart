import 'dart:async';

import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/models/categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/joke_model.dart';
import '../../../models/favorite_joke_model.dart';
import '../../../services/favorite_jokes_service.dart';

class FavoriteJokesController extends StateNotifier<FavoriteJokesState> {
  FavoriteJokesController({required favoriteJokesService})
      : super(FavoriteJokesState.loading) {
    _favoriteJokesService = favoriteJokesService;
  }
  late final FavoriteJokesService _favoriteJokesService;
  List<JokeModel>? favoriteJokes;

  Future<void> getFavorites() async {
    try {
      state = FavoriteJokesState.loading;
      favoriteJokes = await _favoriteJokesService.getFavorites();
      state = FavoriteJokesState.success;
    } catch (e) {
      print(e);
      state = FavoriteJokesState.error;
    }
  }

  Future<void> addJokeTOFavorites(JokeModel joke) async {
    try {
      _favoriteJokesService.addJokeToFavorites(joke);
    } catch (e) {
      print(e);
      state = FavoriteJokesState.error;
    }
  }

  Future<void> removeJokeFromFavorites(JokeModel joke) async {
    try {
      _favoriteJokesService.removeJokeFromFavorites(joke);
    } catch (e) {
      print(e);
      state = FavoriteJokesState.error;
    }
  }

  Future<bool> isFavorite(JokeModel joke) async {
    try {
      final isFavorite = await _favoriteJokesService.isFavorite(joke);
      return isFavorite;
    } catch (e) {
      print(e);
      state = FavoriteJokesState.error;
    }
    return false;
  }

  Future<void> clearFavorites() async {
    try {
      await _favoriteJokesService.clearFavorites();
    } catch (e) {
      print(e);
      state = FavoriteJokesState.error;
    }
  }
}
