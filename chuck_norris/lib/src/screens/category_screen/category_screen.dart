import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/random_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../common/custom_loading_indicator.dart';
import '../../features/random_joke/widgets/categories/category_list.dart';
import '../../features/random_joke/widgets/categories/get_category_button.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Builder(
        builder: (context) {
          final categoriesState = ref.watch(categoriesControllerProvider);
          final categoriesErrorMessage =
              ref.watch(categoriesControllerProvider.notifier).errorMessage;
          switch (categoriesState) {
            case CategoryState.initial:
              return const Center(
                child: GetCategoryButtonUI(),
              );
            case CategoryState.loading:
              return const Center(
                child: LoadingIndicator(),
              );
            case CategoryState.success:
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: CategoryListUI(),
              );
            case CategoryState.error:
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: 250,
                        child: LottieBuilder.asset(
                            "assets/animations/error.json")),
                    Text(
                      categoriesErrorMessage,
                      style: GoogleFonts.kalam(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const GetCategoryButtonUI()
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
