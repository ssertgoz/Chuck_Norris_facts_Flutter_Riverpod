import 'package:chuck_norris/src/common/api.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/data/http_random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/models/random_joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../services/random_joke_service.dart';
import '../widgets/category/controllers/category_item_button_controller.dart';
import '../widgets/category/controllers/get_category_button_controller.dart';

final categoryScreenStateProvider = StateProvider<CategoryState>((ref) {
  return CategoryState.initial;
});

final categoriesProvider = StateProvider<CategoriesModel>((ref) {
  return CategoriesModel(categories: []);
});

// final currentRandomJokeProvider =
//     FutureProvider.autoDispose<RandomJokeModel>((ref) async {
//   final category = ref.watch(categoriesProvider);
//   final randomJoke = await ref
//       .watch(httpRandomJokeRepositoryProvider)
//       .getRandomJokeByCategory(category);
//   return randomJoke;
// });

final categoryItemButtonControllerProvider =
    Provider<CategoryItemButtonController>((ref) {
  return CategoryItemButtonController(
      randomJokeService: RandomJokeService(ref));
});

final getCategoriesButtonControllerProvider =
    Provider<GetCategoriesrButtonController>((ref) {
  return GetCategoriesrButtonController(
      randomJokeService: RandomJokeService(ref));
});

final cartServiceProvider = Provider<RandomJokeService>((ref) {
  return RandomJokeService(ref);
});

final httpRandomJokeRepositoryProvider = Provider<RandomJokeRepository>((ref) {
  return HTTPRandomJokeRepository(client: Client(), api: ChcukNorrisJokeAPI());
});
