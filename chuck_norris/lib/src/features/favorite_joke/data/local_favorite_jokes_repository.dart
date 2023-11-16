import 'package:chuck_norris/src/features/favorite_joke/interfaces/favorite_jokes_repository.dart';
import 'package:chuck_norris/src/features/favorite_joke/models/favorite_joke_model.dart';

class LocalFavoriteJokesRepository implements FavoriteJokesRepository {
  @override
  Future<void> addJokeToFavorites(FavoriteJokeModel joke) {
    // TODO: implement addJokeToFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteJokeModel>> getJokes() {
    // TODO: implement getWeather
    throw UnimplementedError();
  }

  @override
  Future<void> removeJokeFromFavorites(FavoriteJokeModel joke) {
    // TODO: implement removeJokeFromFavorites
    throw UnimplementedError();
  }
}
