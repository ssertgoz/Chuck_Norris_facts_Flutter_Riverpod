import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/models/random_joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/providers.dart';

class RandomJokeService {
  RandomJokeService(this.ref);
  final Ref ref;

  Future<CategoriesModel> getCategories() async {
    CategoriesModel categories =
        await ref.read(httpRandomJokeRepositoryProvider).getCategories();
    return categories;
  }

  Future<RandomJokeModel> getRandomJokeByCategory(String category) async {
    return ref
        .read(httpRandomJokeRepositoryProvider)
        .getRandomJokeByCategory(category);
  }
}
