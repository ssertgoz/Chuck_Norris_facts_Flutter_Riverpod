import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import '../errors/api_errors.dart';

Future<void> openUrl(String url) async => await canLaunchUrl(Uri.parse(url))
    ? await launchUrl(Uri.parse(url))
    : throw Exception();

Future<T> getData<T>(
    {required Uri uri,
    required T Function(dynamic data) builder,
    required Client client}) async {
  try {
    print('${uri.scheme}://${uri.host}${uri.path}');
    final response = await client.get(uri);
    print(response.body);
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return builder(data);
      case 404:
        throw NoCategoriesFoundFoundException();
      case 500: //TODO add message
        throw NoCategoriesFoundFoundException();
      default:
        throw UnknownException();
    }
  } on SocketException catch (_) {
    throw NoInternetConnectionException();
  }
}
