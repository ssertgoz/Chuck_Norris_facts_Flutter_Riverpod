import 'package:chuck_norris/src/widgets/common/joke_card.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/random_joke/see_on_the_web_button.dart';
import 'package:chuck_norris/src/features/search_joke/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/paddings.dart';
import '../../../features/favorite_joke/widgets/favorite_button.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedJoke = ref.watch(selectedJokeProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: CustomPaddings.mediumPaddingHorizontal,
        child: Column(
          children: [
            Expanded(flex: 3, child: JokeCardUI(joke: selectedJoke!)),
            Expanded(
                flex: 2,
                child: Container(
                  margin: CustomPaddings.mediumPaddingVertical,
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeeOnTheWebButtonUI(url: selectedJoke.url),
                      FavoriteButtonUI(
                        joke: selectedJoke,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
