class JokeDTO {
  JokeDTO({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });
  late final List<String> categories;
  late final String createdAt;
  late final String iconUrl;
  late final String id;
  late final String updatedAt;
  late final String url;
  late final String value;

  factory JokeDTO.fromJson(Map<String, dynamic> json) {
    return JokeDTO(
      categories:
          json['categories'].map<String>((data) => data.toString()).toList(),
      createdAt: json['created_at'],
      iconUrl: json['icon_url'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
      value: json['value'],
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
