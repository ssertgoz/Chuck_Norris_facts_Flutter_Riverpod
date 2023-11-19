import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async => await canLaunchUrl(Uri.parse(url))
    ? await launchUrl(Uri.parse(url))
    : throw Exception();
