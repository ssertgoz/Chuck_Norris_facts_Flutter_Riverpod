import '../../../DTOs/joke_dto.dart';
import '../../../models/joke_model.dart';

class FavoriteJokeModel {
  final JokeModel jokeModel;
  final bool isFavorite;

  FavoriteJokeModel({
    required this.jokeModel,
    required this.isFavorite,
  });
}
