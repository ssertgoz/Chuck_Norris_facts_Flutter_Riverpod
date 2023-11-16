import 'package:chuck_norris/src/features/search_joke/models/search_joke_model.dart';

abstract class SearchJokeRepository {
  Future<SearchJokeModel> searchJoke(String searchText);
}
