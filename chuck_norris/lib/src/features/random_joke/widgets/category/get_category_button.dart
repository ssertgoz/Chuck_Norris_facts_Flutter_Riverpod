import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCategoryButtonUI extends ConsumerWidget {
  const GetCategoryButtonUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ref.read(categoryScreenStateProvider.notifier).state =
              CategoryState.initiaLoading;
          ref.read(getCategoriesButtonControllerProvider).getCategories();
        },
        child: Text("Get Category"),
      ),
    );
  }
}
