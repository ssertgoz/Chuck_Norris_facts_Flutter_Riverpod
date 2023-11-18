import 'dart:async';

import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/errors/api_errors.dart';
import 'package:chuck_norris/src/models/categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/random_joke_service.dart';

class CategoriesController extends StateNotifier<CategoryState> {
  CategoriesController({required randomJokeService})
      : super(CategoryState.initial) {
    _randomJokeService = randomJokeService;
  }
  late final RandomJokeService _randomJokeService;
  CategoriesModel? categoriesModel;
  String errorMessage = "";

  Future<void> getCategories() async {
    try {
      state = CategoryState.loading;
      categoriesModel = await _randomJokeService.getCategories();
      state = CategoryState.success;
    } on NoInternetConnectionException catch (e) {
      errorMessage = e.message;
      state = CategoryState.error;
    } on UnknownException catch (e) {
      errorMessage = e.message;
      state = CategoryState.error;
    } on APIException catch (e) {
      errorMessage = e.message;
      state = CategoryState.error;
    } catch (e) {
      errorMessage = e.toString();
      state = CategoryState.error;
    }
  }
}
