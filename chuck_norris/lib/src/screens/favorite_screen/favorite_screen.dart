import 'package:chuck_norris/src/common/custom_loading_indicator.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/app/providers.dart';
import 'package:chuck_norris/src/features/favorite_joke/widgets/favorite_button/clear_alll_button.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Builder(
            builder: (context) {
              switch (favoritesState) {
                case FavoriteJokesState.loading:
                  return LoadingIndicator();
                case FavoriteJokesState.success:
                  return Stack(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.only(top: 100, bottom: 200),
                        itemCount: favorites!.length,
                        itemBuilder: (context, index) =>
                            SearchItem(joke: favorites[index]),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 20),
                          child:
                              const IntrinsicWidth(child: ClearAllButtonUI()))
                    ],
                  );
                case FavoriteJokesState.empty:
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 150, left: 18, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 250,
                              child: LottieBuilder.asset(
                                  "assets/animations/box.json")),
                          Text(
                            "You dont have any favorite joke",
                            style: GoogleFonts.kalam(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  );
                case FavoriteJokesState.error:
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 150, left: 18, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 250,
                              child: LottieBuilder.asset(
                                  "assets/animations/error.json")),
                          Text(
                            "You dont have any favorite joke",
                            style: GoogleFonts.kalam(fontSize: 20),
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
