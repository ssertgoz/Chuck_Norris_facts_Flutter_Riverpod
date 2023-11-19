import 'dart:async';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/joke_model.dart';
import '../../services/favorite_jokes_service.dart';

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
      if (favoriteJokes!.isEmpty) {
        state = FavoriteJokesState.empty;
      } else {
        state = FavoriteJokesState.success;
      }
    } catch (e) {
      state = FavoriteJokesState.error;
    }
  }

  Future<void> addJokeTOFavorites(JokeModel joke) async {
    try {
      _favoriteJokesService.addJokeToFavorites(joke);
    } catch (e) {
      state = FavoriteJokesState.error;
    }
  }

  Future<void> removeJokeFromFavorites(JokeModel joke) async {
    try {
      _favoriteJokesService.removeJokeFromFavorites(joke);
    } catch (e) {
      state = FavoriteJokesState.error;
    }
  }

  Future<bool> isFavorite(JokeModel joke) async {
    try {
      final isFavorite = await _favoriteJokesService.isFavorite(joke);
      return isFavorite;
    } catch (e) {
      state = FavoriteJokesState.error;
    }
    return false;
  }

  Future<void> clearFavorites() async {
    try {
      await _favoriteJokesService.clearFavorites();
      state = FavoriteJokesState.empty;
    } catch (e) {
      state = FavoriteJokesState.error;
    }
  }
}
