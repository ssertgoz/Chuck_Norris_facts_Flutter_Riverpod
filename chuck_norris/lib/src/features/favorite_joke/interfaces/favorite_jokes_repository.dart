import 'package:chuck_norris/src/features/favorite_joke/models/favorite_joke_model.dart';

import '../../../DTOs/joke_dto.dart';

abstract class FavoriteJokesRepository {
  Future<List<JokeDTO>> getJokes();
  Future<void> addJokeToFavorites(Map<String, dynamic> jokeMap);
  Future<void> removeJokeFromFavorites(String id);
  Future<bool> isFavorite(String id);
  Future<void> clearAllFavorites();
}
