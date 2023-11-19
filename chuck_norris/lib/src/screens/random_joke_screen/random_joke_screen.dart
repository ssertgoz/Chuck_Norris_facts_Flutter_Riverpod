import 'package:chuck_norris/src/constants/assets.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/widgets/favorite_button/favorite_button.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/random_joke/see_on_the_web_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../common/custom_loading_indicator.dart';
import '../../common/joke_card.dart';
import '../../constants/font_styles.dart';
import '../../constants/paddings.dart';

class RandomJokeScreen extends ConsumerWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                padding: CustomPaddings.mediumPaddingHorizontal,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3, child: JokeCardUI(joke: randomJokeModel!)),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: CustomPaddings.mediumPaddingVertical,
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
              return Padding(
                padding: CustomPaddings.favoriteScreenPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 250,
                        child: LottieBuilder.asset(AnimationAssets.error)),
                    Text(
                      ref
                          .watch(randomJokeControllerProvider.notifier)
                          .errorMessage,
                      style: CustomFontStyles.kalamLarge,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
