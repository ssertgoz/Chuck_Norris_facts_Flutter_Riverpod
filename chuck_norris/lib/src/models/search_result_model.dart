import '../DTOs/search_result_dto.dart';
import 'joke_model.dart';

class SearchResultModel {
  final int total;
  final List<JokeModel> jokes;

  SearchResultModel({
    required this.total,
    required this.jokes,
  });

  factory SearchResultModel.fromDTO(SearchResultDTO dto) {
    return SearchResultModel(
      total: dto.total,
      jokes: dto.jokes.map((e) => JokeModel.fromDTO(e)).toList(),
    );
  }
}
