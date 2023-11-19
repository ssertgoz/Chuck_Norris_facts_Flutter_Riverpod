import 'dart:async';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/errors/api_errors.dart';
import 'package:chuck_norris/src/models/search_result_model.dart';
import 'package:chuck_norris/src/components/search_joke/services/search_joke_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchJokeController extends StateNotifier<SearchJokeState> {
  SearchJokeController({required randomJokeService})
      : super(SearchJokeState.initial) {
    _searchJokeService = randomJokeService;
  }
  late final SearchJokeService _searchJokeService;
  SearchResultModel? searchresultModel;
  String errorMessage = "";

  Future<void> searchJoke(String searchText) async {
    try {
      if (searchText == "") {
        state = SearchJokeState.initial;
      } else {
        state = SearchJokeState.loading;
        searchresultModel = await _searchJokeService.searchJoke(searchText);
        if (searchresultModel!.jokes.isEmpty) {
          state = SearchJokeState.empty;
        } else {
          state = SearchJokeState.success;
        }
      }
    } on NoInternetConnectionException catch (e) {
      errorMessage = e.message;
      state = SearchJokeState.error;
    } on UnknownException catch (e) {
      errorMessage = e.message;
      state = SearchJokeState.error;
    } on APIException catch (e) {
      errorMessage = e.message;
      state = SearchJokeState.error;
    } catch (e) {
      errorMessage = e.toString();
      state = SearchJokeState.error;
    }
  }
}
