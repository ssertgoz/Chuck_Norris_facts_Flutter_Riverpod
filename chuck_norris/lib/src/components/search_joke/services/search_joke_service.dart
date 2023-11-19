import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class SearchJokeService {
  SearchJokeService(this.ref);
  final Ref ref;

  Future<SearchResultModel> searchJoke(String searchText) async {
    SearchResultModel categories =
        await ref.read(httpSearchJokeRepositoryProvider).searchJoke(searchText);
    return categories;
  }
}
