import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class ClearAllButtonUI extends ConsumerWidget {
  const ClearAllButtonUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final favoritesState = ref.watch(favoritesControllerProvider);
    return favoritesState == FavoriteJokesState.empty
        ? Container()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.redColor),
            onPressed: () {
              ref.read(favoritesControllerProvider.notifier).clearFavorites();
              ref.read(favoritesControllerProvider.notifier).getFavorites();
            },
            child: Row(
              children: [
                const Text(
                  "Clear All",
                  style: TextStyle(color: CustomColors.lightThemeColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(Icons.clear_sharp,
                    size: height * 0.02, color: CustomColors.lightThemeColor)
              ],
            ));
  }
}
