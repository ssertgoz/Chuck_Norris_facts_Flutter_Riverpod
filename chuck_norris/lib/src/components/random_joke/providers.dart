import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/components/random_joke/data/http_random_joke_repository.dart';
import 'package:chuck_norris/src/components/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/components/random_joke/widgets/categories/controllers/categories_controller.dart';
import 'package:chuck_norris/src/components/random_joke/widgets/random_joke/controllers/random_joke_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../APIs/chuck_norris/chuck_norris_api.dart';
import 'services/random_joke_service.dart';

final selectedCategoryProvider = StateProvider<String>((ref) {
  return "";
});

final randomJokeControllerProvider =
    StateNotifierProvider<RandomJokeController, RandomJokeState>((ref) {
  return RandomJokeController(
      randomJokeService: ref.watch(randomJokeServiceProvider));
});

final categoriesControllerProvider =
    StateNotifierProvider<CategoriesController, CategoryState>((ref) {
  return CategoriesController(
      randomJokeService: ref.watch(randomJokeServiceProvider));
});

final randomJokeServiceProvider = Provider<RandomJokeService>((ref) {
  return RandomJokeService(ref);
});

final httpRandomJokeRepositoryProvider = Provider<RandomJokeRepository>((ref) {
  return HTTPRandomJokeRepository(client: Client(), api: ChcukNorrisJokeAPI());
});
