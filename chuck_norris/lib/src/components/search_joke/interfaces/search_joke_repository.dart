import '../../../models/search_result_model.dart';

abstract class SearchJokeRepository {
  Future<SearchResultModel> searchJoke(String searchText);
}
