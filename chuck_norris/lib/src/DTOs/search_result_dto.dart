import 'package:chuck_norris/src/DTOs/joke_dto.dart';

class SearchResultDTO {
  SearchResultDTO({
    required this.total,
    required this.jokes,
  });
  late final int total;
  late final List<JokeDTO> jokes;

  factory SearchResultDTO.fromJson(Map<String, dynamic> json) {
    return SearchResultDTO(
      total: json['total'],
      jokes: json['result'].map<JokeDTO>((e) => JokeDTO.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    data['result'] = jokes.map((e) => e.toJson()).toList();
    return data;
  }
}
