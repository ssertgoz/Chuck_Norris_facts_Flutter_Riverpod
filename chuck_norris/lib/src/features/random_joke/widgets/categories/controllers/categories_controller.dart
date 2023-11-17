import 'dart:async';

import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/random_joke_service.dart';

class CategoriesController extends StateNotifier<CategoryState> {
  CategoriesController({required randomJokeService})
      : super(CategoryState.initial) {
    _randomJokeService = randomJokeService;
  }
  late final RandomJokeService _randomJokeService;
  CategoriesModel? categoriesModel;

  Future<void> getCategories() async {
    try {
      state = CategoryState.initiaLoading;
      categoriesModel = await _randomJokeService.getCategories();
      state = CategoryState.success;
    } catch (e) {
      state = CategoryState.error;
    }
  }

  @override
  FutureOr<CategoryState> build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
