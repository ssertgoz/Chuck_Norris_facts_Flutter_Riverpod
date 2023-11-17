import 'package:chuck_norris/src/common/api.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/data/http_random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/categories/controllers/categories_controller.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/random_joke/controllers/random_joke_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../services/random_joke_service.dart';

final selectedCategoryProvider = StateProvider<String>((ref) {
  return "";
});

final randomJokeControllerProvider =
    StateNotifierProvider<RandomJokeController, RandomJokeState>((ref) {
  return RandomJokeController(randomJokeService: RandomJokeService(ref));
});

final categoriesControllerProvider =
    StateNotifierProvider<CategoriesController, CategoryState>((ref) {
  return CategoriesController(randomJokeService: RandomJokeService(ref));
});

final cartServiceProvider = Provider<RandomJokeService>((ref) {
  return RandomJokeService(ref);
});

final httpRandomJokeRepositoryProvider = Provider<RandomJokeRepository>((ref) {
  return HTTPRandomJokeRepository(client: Client(), api: ChcukNorrisJokeAPI());
});
