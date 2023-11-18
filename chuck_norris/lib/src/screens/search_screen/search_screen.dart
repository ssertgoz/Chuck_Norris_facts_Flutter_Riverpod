import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/search_joke/app/providers.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_bar.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/custom_loading_indicator.dart';

class SearchJokeScreen extends ConsumerWidget {
  const SearchJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchJokeControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            SafeArea(top: true, bottom: false, child: const SearchBarUI()),
            Expanded(child: Builder(
              builder: (context) {
                switch (searchState) {
                  case SearchJokeState.initial:
                    return const Center(
                      child: Text("Search"),
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
                    return const Center(
                      child: Text("Error"),
                    );
                  case SearchJokeState.empty:
                    return const Center(
                      child: Text("Empty"),
                    );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
