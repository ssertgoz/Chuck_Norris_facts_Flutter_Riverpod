import 'package:chuck_norris/src/dtos/search_result_dto.dart';
import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:http/http.dart';
import '../../../APIs/chuck_norris/chuck_norris_api.dart';
import '../../../APIs/chuck_norris/helper_functions.dart';
import '../interfaces/search_joke_repository.dart';

class HTTPSearchJokeRepository implements SearchJokeRepository {
  HTTPSearchJokeRepository({required this.client, required this.api});

  final Client client;
  final ChcukNorrisJokeAPI api;

  @override
  Future<SearchResultModel> searchJoke(String searchText) async {
    final categroiesDTO = await getData(
        uri: api.searchJokes(searchText),
        builder: (data) => SearchResultDTO.fromJson(data),
        client: client);
    return SearchResultModel.fromDTO(categroiesDTO);
  }
}
