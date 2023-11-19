import 'package:chuck_norris/src/components/random_joke/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeOnTheWebButtonUI extends ConsumerWidget {
  const SeeOnTheWebButtonUI({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
        onPressed: () {
          ref
              .read(randomJokeControllerProvider.notifier)
              .openUrlOntheBrowser(url);
        },
        child: Row(
          children: [
            const Text("See on the web"),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_outward,
              size: height * 0.02,
            )
          ],
        ));
  }
}
