import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/search_joke/services/search_joke_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../APIs/chuck_norris/chuck_norris_api.dart';
import '../../models/joke_model.dart';
import 'data/http_search_joke_repository.dart';
import 'interfaces/search_joke_repository.dart';
import 'widgets/controllers/search_joke_controller.dart';

final selectedJokeProvider = StateProvider<JokeModel?>((ref) {
  return;
});
final searchJokeControllerProvider =
    StateNotifierProvider<SearchJokeController, SearchJokeState>((ref) {
  return SearchJokeController(randomJokeService: SearchJokeService(ref));
});

final httpSearchJokeRepositoryProvider = Provider<SearchJokeRepository>((ref) {
  return HTTPSearchJokeRepository(client: Client(), api: ChcukNorrisJokeAPI());
});
