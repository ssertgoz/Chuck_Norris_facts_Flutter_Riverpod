import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeOnTheWebButtonUI extends ConsumerWidget {
  const SeeOnTheWebButtonUI({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref
              .read(randomJokeControllerProvider.notifier)
              .openUrlOntheBrowser(url);
        },
        child: const Row(
          children: [
            Text("See on the web"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_outward)
          ],
        ));
  }
}
