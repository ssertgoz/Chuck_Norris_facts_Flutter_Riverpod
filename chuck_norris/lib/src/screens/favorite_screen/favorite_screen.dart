import 'package:chuck_norris/src/common/custom_loading_indicator.dart';
import 'package:chuck_norris/src/constants/assets.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/app/providers.dart';
import 'package:chuck_norris/src/features/favorite_joke/widgets/favorite_button/clear_alll_button.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../constants/font_styles.dart';
import '../../constants/paddings.dart';

class FavoriteJokesScreen extends ConsumerStatefulWidget {
  const FavoriteJokesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoriteJokesScreen> createState() =>
      _FavoriteJokesScreenState();
}

class _FavoriteJokesScreenState extends ConsumerState<FavoriteJokesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(favoritesControllerProvider.notifier).getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesState = ref.watch(favoritesControllerProvider);
    final favorites =
        ref.watch(favoritesControllerProvider.notifier).favoriteJokes;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriets"),
      ),
      body: Container(
          padding: CustomPaddings.largePaddingHorizontal,
          child: Builder(
            builder: (context) {
              switch (favoritesState) {
                case FavoriteJokesState.loading:
                  return LoadingIndicator();
                case FavoriteJokesState.success:
                  return Stack(
                    children: [
                      ListView.builder(
                        padding: CustomPaddings.listPadding,
                        itemCount: favorites!.length,
                        itemBuilder: (context, index) =>
                            SearchItem(joke: favorites[index]),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          margin: CustomPaddings.largePaddingVertical,
                          child:
                              const IntrinsicWidth(child: ClearAllButtonUI()))
                    ],
                  );
                case FavoriteJokesState.empty:
                  return Center(
                    child: Padding(
                      padding: CustomPaddings.favoriteScreenPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 250,
                              child: LottieBuilder.asset(
                                  AnimationAssets.emptyBox)),
                          Text(
                            "You dont have any favorite joke",
                            style: CustomFontStyles.kalamLarge,
                          )
                        ],
                      ),
                    ),
                  );
                case FavoriteJokesState.error:
                  return Center(
                    child: Padding(
                      padding: CustomPaddings.favoriteScreenPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 250,
                              child:
                                  LottieBuilder.asset(AnimationAssets.error)),
                          Text(
                            "Unknown error occured while getting favorites",
                            style: CustomFontStyles.kalamLarge,
                          )
                        ],
                      ),
                    ),
                  );
              }
            },
          )),
    );
  }
}
