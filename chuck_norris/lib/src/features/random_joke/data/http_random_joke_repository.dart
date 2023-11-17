import 'dart:convert';
import 'dart:io';

import 'package:chuck_norris/src/DTOs/categories_dto.dart';
import 'package:chuck_norris/src/DTOs/joke_dto.dart';
import 'package:chuck_norris/src/common/api.dart';
import 'package:chuck_norris/src/errors/api_errors.dart';
import 'package:chuck_norris/src/features/random_joke/interfaces/random_joke_repository.dart';
import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/models/random_joke_model.dart';
import 'package:http/http.dart';

class HTTPRandomJokeRepository implements RandomJokeRepository {
  HTTPRandomJokeRepository({required this.client, required this.api});

  final Client client;
  final ChcukNorrisJokeAPI api;

  @override
  Future<CategoriesModel> getCategories() async {
    final categroiesDTO = await _getData(
      uri: api.categories(),
      builder: (data) => CategoriesDTO(categories: data),
    );
    return CategoriesModel.fromDTO(categroiesDTO);
  }

  @override
  Future<RandomJokeModel> getRandomJokeByCategory(String category) async {
    final randomJokeDTO = await _getData(
      uri: api.randomJokeByCategory(category),
      builder: (data) => JokeDTO.fromJson(data),
    );
    return RandomJokeModel.fromDTO(randomJokeDTO);
  }

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      print('${uri.scheme}://${uri.host}${uri.path}');
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 404:
          throw NoCategoriesFoundFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (_) {
      throw NoInternetConnectionException();
    }
  }
}
