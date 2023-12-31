import 'package:chuck_norris/src/dtos/categories_dto.dart';
import 'package:chuck_norris/src/dtos/joke_dto.dart';
import 'package:chuck_norris/src/components/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/models/categories_model.dart';
import 'package:http/http.dart';
import '../../../APIs/chuck_norris/chuck_norris_api.dart';
import '../../../APIs/chuck_norris/helper_functions.dart';
import '../../../models/joke_model.dart';

class HTTPRandomJokeRepository implements RandomJokeRepository {
  HTTPRandomJokeRepository({required this.client, required this.api});

  final Client client;
  final ChcukNorrisJokeAPI api;

  @override
  Future<CategoriesModel> getCategories() async {
    final categroiesDTO = await getData(
        uri: api.categories(),
        builder: (data) => CategoriesDTO(categories: data),
        client: client);
    return CategoriesModel.fromDTO(categroiesDTO);
  }

  @override
  Future<JokeModel> getRandomJokeByCategory(String category) async {
    final randomJokeDTO = await getData(
        uri: api.randomJokeByCategory(category),
        builder: (data) => JokeDTO.fromJson(data),
        client: client);
    return JokeModel.fromDTO(randomJokeDTO);
  }
}
