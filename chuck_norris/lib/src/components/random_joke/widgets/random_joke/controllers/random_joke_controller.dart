import 'dart:async';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../errors/api_errors.dart';
import '../../../../../models/joke_model.dart';
import '../../../services/random_joke_service.dart';

class RandomJokeController extends StateNotifier<RandomJokeState> {
  RandomJokeController({required randomJokeService})
      : super(RandomJokeState.loading) {
    _randomJokeService = randomJokeService;
  }
  late final RandomJokeService _randomJokeService;
  JokeModel? randomJokeModel;
  String errorMessage = "";

  Future<void> getJokeByCategory(String category) async {
    try {
      state = RandomJokeState.loading;
      randomJokeModel =
          await _randomJokeService.getRandomJokeByCategory(category);
      state = RandomJokeState.success;
    } on NoInternetConnectionException catch (e) {
      errorMessage = e.message;
      state = RandomJokeState.error;
    } on UnknownException catch (e) {
      errorMessage = e.message;
      state = RandomJokeState.error;
    } on APIException catch (e) {
      errorMessage = e.message;
      state = RandomJokeState.error;
    } catch (e) {
      errorMessage = e.toString();
      state = RandomJokeState.error;
    }
  }

  Future<void> openUrlOntheBrowser(String url) async {
    try {
      openUrl(url);
    } on NoInternetConnectionException catch (e) {
      errorMessage = e.message;
      state = RandomJokeState.error;
    } on UnknownException catch (e) {
      errorMessage = e.message;
      state = RandomJokeState.error;
    } catch (e) {
      errorMessage = e.toString();
      state = RandomJokeState.error;
    }
  }
}
