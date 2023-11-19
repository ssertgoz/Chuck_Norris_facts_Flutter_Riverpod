class ChcukNorrisJokeAPI {
  ChcukNorrisJokeAPI();

  static const String _apiBaseUrl = "api.chucknorris.io";

  Uri categories() => _buildUri(
        endpoint: "jokes/categories",
      );

  Uri randomJokeByCategory(String category) => _buildUri(
        endpoint: "jokes/random",
        parametersBuilder: () => _randomJokeQueryParameters(category),
      );

  Uri searchJokes(String searchText) => _buildUri(
        endpoint: "jokes/search",
        parametersBuilder: () => _searchQueryParameters(searchText),
      );

  Uri _buildUri({
    required String endpoint,
    Map<String, dynamic> Function()? parametersBuilder,
  }) {
    return Uri(
        scheme: "https",
        host: _apiBaseUrl,
        path: endpoint,
        queryParameters:
            parametersBuilder != null ? parametersBuilder() : null);
  }

  Map<String, dynamic> _randomJokeQueryParameters(String category) => {
        "category": category,
      };
  Map<String, dynamic> _searchQueryParameters(String searchText) => {
        "query": searchText,
      };
}
