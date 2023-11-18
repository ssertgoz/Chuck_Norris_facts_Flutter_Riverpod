import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/search_joke/app/providers.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_bar.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../common/custom_loading_indicator.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SearchBarUI(),
              Expanded(child: Builder(
                builder: (context) {
                  switch (searchState) {
                    case SearchJokeState.initial:
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 250,
                                child: LottieBuilder.asset(
                                    "assets/animations/search.json")),
                            Text(
                              "Search Somethings",
                              style: GoogleFonts.kalam(),
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
                        padding: const EdgeInsets.only(bottom: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 250,
                                child: LottieBuilder.asset(
                                    "assets/animations/error.json")),
                            Text(
                              ref
                                  .watch(searchJokeControllerProvider.notifier)
                                  .errorMessage,
                              style: GoogleFonts.kalam(),
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
                            child: LottieBuilder.asset(
                                "assets/animations/no_result.json",
                                fit: BoxFit.fitHeight),
                          ),
                          Text("There is no result",
                              style: GoogleFonts.kalam(fontSize: 20)),
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
