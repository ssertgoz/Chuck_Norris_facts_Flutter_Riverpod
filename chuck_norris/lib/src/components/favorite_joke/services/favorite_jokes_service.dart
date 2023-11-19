import 'package:chuck_norris/src/dtos/joke_dto.dart';
import 'package:chuck_norris/src/components/favorite_joke/providers.dart';
import 'package:chuck_norris/src/models/joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteJokesService {
  const FavoriteJokesService({required this.ref});

  final Ref ref;

  Future<List<JokeModel>> getFavorites() async {
    List<JokeDTO> favorites =
        await ref.read(locaFavoriteJokesRepositoryProvider).getJokes();
    return List.generate(favorites.length, (i) {
      return JokeModel.fromDTO(favorites[i]);
    });
  }

  Future<void> addJokeToFavorites(JokeModel joke) async {
    await ref
        .read(locaFavoriteJokesRepositoryProvider)
        .addJokeToFavorites(joke.toJson());
    ref.read(statusChangedJokeProvider.notifier).state = joke;
  }

  Future<void> removeJokeFromFavorites(JokeModel joke) async {
    await ref
        .read(locaFavoriteJokesRepositoryProvider)
        .removeJokeFromFavorites(joke.id);
    ref.read(statusChangedJokeProvider.notifier).state = joke;
  }

  Future<bool> isFavorite(JokeModel joke) async {
    final isFavorite =
        await ref.read(locaFavoriteJokesRepositoryProvider).isFavorite(joke.id);
    return isFavorite;
  }

  Future<void> clearFavorites() async {
    await ref.read(locaFavoriteJokesRepositoryProvider).clearAllFavorites();
  }
}
