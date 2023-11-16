import 'package:chuck_norris/src/features/search_joke/models/search_joke_model.dart';

import '../../../DTOs/search_result_dto.dart';

class SearchResultModel {
  final int total;
  final List<SearchJokeModel> jokes;

  SearchResultModel({
    required this.total,
    required this.jokes,
  });

  factory SearchResultModel.fromDTO(SearchResultDTO dto) {
    return SearchResultModel(
      total: dto.total,
      jokes: dto.jokes.map((e) => SearchJokeModel.fromDTO(e)).toList(),
    );
  }
}
