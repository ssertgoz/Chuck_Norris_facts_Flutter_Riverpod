import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/random_joke_service.dart';

class CategoryItemButtonController extends StateNotifier {
  CategoryItemButtonController({required this.randomJokeService}) : super(null);
  final RandomJokeService randomJokeService;

  Future<void> getJokeByCategory(String category) async {
    randomJokeService.getrandomJokeByCategory(category);
  }
}
