class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class NoCategoriesFoundFoundException extends APIException {
  NoCategoriesFoundFoundException() : super('No categories found');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
