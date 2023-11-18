import 'package:chuck_norris/src/models/categories_model.dart';
import '../../../models/joke_model.dart';

abstract class RandomJokeRepository {
  Future<JokeModel> getRandomJokeByCategory(String category);
  Future<CategoriesModel> getCategories();
}
