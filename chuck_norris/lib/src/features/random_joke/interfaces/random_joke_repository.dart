import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import '../models/random_joke_model.dart';

abstract class RandomJokeRepository {
  Future<RandomJokeModel> getRandomByCategoryJoke(String category);
  Future<CategoriesModel> getCategories();
}
