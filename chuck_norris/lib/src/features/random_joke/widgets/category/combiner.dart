import 'package:chuck_norris/src/common/custom_loading_indicator.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:chuck_norris/src/features/random_joke/models/categories_model.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/category/category_list.dart';
import 'package:chuck_norris/src/features/random_joke/widgets/category/get_category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesCombinerUI extends ConsumerWidget {
  const CategoriesCombinerUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoryScreenStateProvider);
    final categories = ref.watch(categoriesProvider.notifier);
    switch (categoriesState) {
      case CategoryState.initial:
        return const Center(
          child: GetCategoryButtonUI(),
        );
      case CategoryState.initiaLoading:
        return const Center(
          child: LoadingIndicator(),
        );
      case CategoryState.swipeLoading:
        return const Center(
          child: LoadingIndicator(),
        );
      case CategoryState.success:
        return Center(
          child: CategoryListUI(categoriesModel: categories.state),
        );
      case CategoryState.error:
        return const Center(
          child: Text("data"),
        );
    }
  }
}
