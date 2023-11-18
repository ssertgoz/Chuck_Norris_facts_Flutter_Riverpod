import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/categories/category_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListUI extends ConsumerWidget {
  const CategoryListUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesController =
        ref.watch(categoriesControllerProvider.notifier);
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 300, top: 50),
      itemCount: categoriesController.categoriesModel?.categories.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: CategoryItemButtonUI(
            category: categoriesController.categoriesModel!.categories[index],
          ),
        );
      },
    );
  }
}
