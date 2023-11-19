import 'package:chuck_norris/src/constants/assets.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/search_joke/app/providers.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_bar.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../common/custom_loading_indicator.dart';
import '../../constants/font_styles.dart';
import '../../constants/paddings.dart';

class SearchJokeScreen extends ConsumerWidget {
  const SearchJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchJokeControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: CustomPaddings.largePaddingHorizontal,
          child: Column(
            children: [
              const SearchBarUI(),
              Expanded(child: Builder(
                builder: (context) {
                  switch (searchState) {
                    case SearchJokeState.initial:
                      return Padding(
                        padding: CustomPaddings.favoriteScreenPadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 250,
                                child: LottieBuilder.asset(
                                    AnimationAssets.search)),
                            Text(
                              "Search Somethings",
                              style: CustomFontStyles.kalamLarge,
                            ),
                          ],
                        ),
                      );
                    case SearchJokeState.loading:
                      return const Center(
                        child: LoadingIndicator(),
                      );
                    case SearchJokeState.success:
                      return SearchList(
                          searchResult: ref
                              .watch(searchJokeControllerProvider.notifier)
                              .searchresultModel!);
                    case SearchJokeState.error:
                      return Padding(
                        padding: CustomPaddings.favoriteScreenPadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 250,
                                child:
                                    LottieBuilder.asset(AnimationAssets.error)),
                            Text(
                              ref
                                  .watch(searchJokeControllerProvider.notifier)
                                  .errorMessage,
                              style: CustomFontStyles.kalamLarge,
                            ),
                          ],
                        ),
                      );
                    case SearchJokeState.empty:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            child:
                                LottieBuilder.asset(AnimationAssets.noResult),
                          ),
                          Text("There is no result",
                              style: CustomFontStyles.kalamLarge),
                        ],
                      );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
