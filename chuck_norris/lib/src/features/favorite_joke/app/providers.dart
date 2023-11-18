import 'package:chuck_norris/src/features/favorite_joke/data/local_favorite_jokes_repository.dart';
import 'package:chuck_norris/src/models/joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/enums.dart';
import '../../random_joke/widgets/categories/controllers/categories_controller.dart';
import '../interfaces/favorite_jokes_repository.dart';
import '../services/favorite_jokes_service.dart';
import '../widgets/favorite_button/controllers/favorite_jokes_controller.dart';

final statusChangedJokeProvider = StateProvider<JokeModel?>((ref) => null);

final favoritesControllerProvider =
    StateNotifierProvider<FavoriteJokesController, FavoriteJokesState>((ref) {
  return FavoriteJokesController(
      favoriteJokesService: ref.watch(favoriteJokeServiceProvider));
});

final favoriteJokeServiceProvider = Provider<FavoriteJokesService>((ref) {
  return FavoriteJokesService(ref: ref);
});

final locaFavoriteJokesRepositoryProvider =
    Provider<FavoriteJokesRepository>((ref) {
  return LocalFavoriteJokesRepository();
});
