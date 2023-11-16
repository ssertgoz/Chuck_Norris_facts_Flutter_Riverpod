import '../../../DTOs/joke_dto.dart';

class FavoriteJokeModel {
  final List<String> categories;
  final String createdAt;
  final String iconUrl;
  final String id;
  final String updatedAt;
  final String url;
  final String value;

  FavoriteJokeModel({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  factory FavoriteJokeModel.fromDTO(JokeDTO dto) {
    return FavoriteJokeModel(
      categories: dto.categories,
      createdAt: dto.createdAt,
      iconUrl: dto.iconUrl,
      id: dto.id,
      updatedAt: dto.updatedAt,
      url: dto.url,
      value: dto.value,
    );
  }
}
