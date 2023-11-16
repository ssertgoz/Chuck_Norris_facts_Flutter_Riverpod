import 'package:chuck_norris/src/features/favorite_joke/models/favorite_joke_model.dart';

abstract class FavoriteJokesRepository {
  Future<List<FavoriteJokeModel>> getJokes();
  Future<void> addJokeToFavorites(FavoriteJokeModel joke);
  Future<void> removeJokeFromFavorites(FavoriteJokeModel joke);
}
