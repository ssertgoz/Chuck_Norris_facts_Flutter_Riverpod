import 'package:chuck_norris/src/features/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/models/random_joke_model.dart';

class HTTPRandomJokeRepository implements RandomJokeRepository {
  @override
  Future<CategoriesModel> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<RandomJokeModel> getRandomByCategoryJoke(String category) {
    // TODO: implement getRandomByCategoryJoke
    throw UnimplementedError();
  }
}
