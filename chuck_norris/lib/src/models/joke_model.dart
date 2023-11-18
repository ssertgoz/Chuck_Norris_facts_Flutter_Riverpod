import '../DTOs/joke_dto.dart';

class JokeModel {
  final List<String> categories;
  final String createdAt;
  final String iconUrl;
  final String id;
  final String updatedAt;
  final String url;
  final String value;

  JokeModel({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  factory JokeModel.fromDTO(JokeDTO dto) {
    return JokeModel(
      categories: dto.categories,
      createdAt: dto.createdAt,
      iconUrl: dto.iconUrl,
      id: dto.id,
      updatedAt: dto.updatedAt,
      url: dto.url,
      value: dto.value,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['categories'] = categories;
    data['created_at'] = createdAt;
    data['icon_url'] = iconUrl;
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['url'] = url;
    data['value'] = value;
    return data;
  }
}
