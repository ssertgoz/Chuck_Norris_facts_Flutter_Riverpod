import 'package:chuck_norris/src/models/categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/joke_model.dart';
import '../providers.dart';

class RandomJokeService {
  RandomJokeService(this.ref);
  final Ref ref;

  Future<CategoriesModel> getCategories() async {
    CategoriesModel categories =
        await ref.read(httpRandomJokeRepositoryProvider).getCategories();
    return categories;
  }

  Future<JokeModel> getRandomJokeByCategory(String category) async {
    return ref
        .read(httpRandomJokeRepositoryProvider)
        .getRandomJokeByCategory(category);
  }
}
