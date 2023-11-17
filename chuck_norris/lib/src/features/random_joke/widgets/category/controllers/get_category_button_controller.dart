import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/services/random_joke_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCategoriesrButtonController extends StateNotifier {
  GetCategoriesrButtonController({required this.randomJokeService})
      : super(const AsyncData(CategoryState.initial));
  final RandomJokeService randomJokeService;

  Future<void> getCategories() async {
    randomJokeService.getCategories();
  }
}
