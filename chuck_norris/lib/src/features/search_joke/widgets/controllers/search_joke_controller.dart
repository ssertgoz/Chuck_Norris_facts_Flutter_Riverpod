import 'dart:async';

import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:chuck_norris/src/features/search_joke/services/search_joke_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchJokeController extends StateNotifier<SearchJokeState> {
  SearchJokeController({required randomJokeService})
      : super(SearchJokeState.initial) {
    _searchJokeService = randomJokeService;
  }
  late final SearchJokeService _searchJokeService;
  SearchResultModel? searchresultModel;

  Future<void> searchJoke(String searchText) async {
    try {
      state = SearchJokeState.loading;
      searchresultModel = await _searchJokeService.searchJoke(searchText);
      state = SearchJokeState.success;
    } catch (e) {
      print(e);
      state = SearchJokeState.error;
    }
  }
}
