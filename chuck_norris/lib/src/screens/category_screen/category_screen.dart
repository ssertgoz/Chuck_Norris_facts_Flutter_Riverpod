import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/custom_loading_indicator.dart';
import '../../features/random_joke/widgets/categories/category_list.dart';
import '../../features/random_joke/widgets/categories/get_category_button.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final categoriesState = ref.watch(categoriesControllerProvider);

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
              return const Center(
                child: CategoryListUI(),
              );
            case CategoryState.error:
              return const Center(
                child: Text("Error"),
              );
          }
        },
      ),
    );
  }
}
