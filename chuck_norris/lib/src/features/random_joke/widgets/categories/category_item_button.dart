import 'package:chuck_norris/routing/app_router.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryItemButtonUI extends ConsumerWidget {
  const CategoryItemButtonUI({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(selectedCategoryProvider.notifier).state = category;
        ref
            .read(randomJokeControllerProvider.notifier)
            .getJokeByCategory(category);
        context.push(RouteNames.randomJokeScreen);
      },
      child: Text(
        category[0].toUpperCase() + category.substring(1),
      ),
    );
  }
}
