import 'dart:async';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/models/random_joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/random_joke_service.dart';

class RandomJokeController extends StateNotifier<RandomJokeState> {
  RandomJokeController({required randomJokeService})
      : super(RandomJokeState.loading) {
    _randomJokeService = randomJokeService;
  }
  late final RandomJokeService _randomJokeService;
  RandomJokeModel? randomJokeModel;

  Future<void> getJokeByCategory(String category) async {
    try {
      state = RandomJokeState.loading;
      randomJokeModel =
          await _randomJokeService.getRandomJokeByCategory(category);
      state = RandomJokeState.success;
    } catch (e) {
      state = RandomJokeState.error;
    }
  }

  @override
  FutureOr<RandomJokeState> build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
