import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';

class ClearAllButtonUI extends ConsumerWidget {
  const ClearAllButtonUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesControllerProvider);
    return favoritesState == FavoriteJokesState.empty
        ? Container()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: redColor),
            onPressed: () {
              ref.read(favoritesControllerProvider.notifier).clearFavorites();
              ref.read(favoritesControllerProvider.notifier).getFavorites();
            },
            child: const Row(
              children: [
                Text(
                  "Clear All",
                  style: TextStyle(color: lightThemeColor),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.clear_sharp, size: 20, color: lightThemeColor)
              ],
            ));
  }
}
