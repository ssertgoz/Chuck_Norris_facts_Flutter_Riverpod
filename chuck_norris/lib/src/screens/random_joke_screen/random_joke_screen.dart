import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/custom_loading_indicator.dart';

class RandomJokeScreen extends ConsumerWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.read(selectedCategoryProvider.notifier).state;

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
              return Center(
                child: Text(ref
                        .watch(randomJokeControllerProvider.notifier)
                        .randomJokeModel
                        ?.value ??
                    ""),
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
