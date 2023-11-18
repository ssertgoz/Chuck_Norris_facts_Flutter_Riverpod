import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/widgets/favorite_button/favorite_button.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/random_joke/see_on_the_web_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/custom_loading_indicator.dart';
import '../../common/joke_card.dart';
import '../../features/favorite_joke/app/providers.dart';

class RandomJokeScreen extends ConsumerWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.read(selectedCategoryProvider.notifier).state;
    final randomJokeModel =
        ref.watch(randomJokeControllerProvider.notifier).randomJokeModel;
    final randomJokeState = ref.watch(randomJokeControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          switch (randomJokeState) {
            case RandomJokeState.loading:
              return const Center(
                child: LoadingIndicator(),
              );
            case RandomJokeState.success:
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2, child: JokeCardUI(joke: randomJokeModel!)),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SeeOnTheWebButtonUI(url: randomJokeModel.url),
                          FavoriteButton(
                            joke: randomJokeModel,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              );

            case RandomJokeState.error:
              return const Center(
                child: Text("Error"),
              );
          }
        },
      ),
    );
  }
}
