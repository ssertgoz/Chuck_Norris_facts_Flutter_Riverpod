import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/category/category_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListUI extends ConsumerWidget {
  final CategoriesModel categoriesModel;
  const CategoryListUI({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: categoriesModel.categories.length,
      itemBuilder: (context, index) {
        return CategoryItemButtonUI(
          category: categoriesModel.categories[index],
        );
      },
    );
  }
}
