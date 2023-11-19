import 'package:chuck_norris/src/constants/assets.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/constants/font_styles.dart';
import 'package:chuck_norris/src/constants/paddings.dart';
import 'package:chuck_norris/src/components/search_joke/providers.dart';
import 'package:chuck_norris/src/components/search_joke/widgets/search_bar.dart';
import 'package:chuck_norris/src/components/search_joke/widgets/search_list.dart';
import 'package:chuck_norris/src/widgets/common/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SearchJokeScreen extends ConsumerWidget {
  const SearchJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final searchState = ref.watch(searchJokeControllerProvider);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: CustomPaddings.largePaddingHorizontal,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Builder(
                        builder: (context) {
                          switch (searchState) {
                            case SearchJokeState.initial:
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: height * 0.2,
                                      child: LottieBuilder.asset(
                                          AnimationAssets.search)),
                                  Text(
                                    "Search Somethings",
                                    style: CustomFontStyles.kalamLarge,
                                  ),
                                ],
                              );
                            case SearchJokeState.loading:
                              return const Center(
                                child: LoadingIndicator(),
                              );
                            case SearchJokeState.success:
                              return SearchListUI(
                                  searchResult: ref
                                      .watch(
                                          searchJokeControllerProvider.notifier)
                                      .searchresultModel!);
                            case SearchJokeState.error:
                              return Padding(
                                padding: CustomPaddings.favoriteScreenPadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height * 0.2,
                                        child: LottieBuilder.asset(
                                            AnimationAssets.error)),
                                    Text(
                                      ref
                                          .watch(searchJokeControllerProvider
                                              .notifier)
                                          .errorMessage,
                                      style: CustomFontStyles.kalamLarge,
                                    ),
                                  ],
                                ),
                              );
                            case SearchJokeState.empty:
                              return Padding(
                                padding: CustomPaddings.favoriteScreenPadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: height * 0.2,
                                      child: LottieBuilder.asset(
                                          AnimationAssets.noResult),
                                    ),
                                    Text("There is no result",
                                        style: CustomFontStyles.kalamLarge),
                                  ],
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SearchBarUI(),
            ],
          ),
        ),
      ),
    );
  }
}
