import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import '../errors/api_errors.dart';

Future<void> openUrl(String url) async => await canLaunchUrl(Uri.parse(url))
    ? await launchUrl(Uri.parse(url))
    : throw Exception();

String apiMessageFormatter(Response response) {
  String message = json.decode(response.body)["message"].split(": ")[1];
  message = message[0].toUpperCase() + message.substring(1);
  return message;
}

Future<T> getData<T>(
    {required Uri uri,
    required T Function(dynamic data) builder,
    required Client client}) async {
  try {
    final response = await client.get(uri);
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return builder(data);
      case 404:
        throw APIException(apiMessageFormatter(response));
      case 500:
        throw APIException(apiMessageFormatter(response));
      default:
        throw UnknownException();
    }
  } on SocketException catch (_) {
    throw NoInternetConnectionException();
  }
}
