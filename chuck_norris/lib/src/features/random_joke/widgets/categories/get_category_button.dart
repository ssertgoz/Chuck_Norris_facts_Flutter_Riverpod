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
          ref.read(categoriesControllerProvider.notifier).getCategories();
        },
        child: Text("Get Category"),
      ),
    );
  }
}
