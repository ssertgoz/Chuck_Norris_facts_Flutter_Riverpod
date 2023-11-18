import 'package:chuck_norris/src/common/custom_loading_indicator.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/app/providers.dart';
import 'package:chuck_norris/src/features/favorite_joke/widgets/favorite_button/favorite_button.dart';
import 'package:chuck_norris/src/features/search_joke/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Container(child: Builder(
        builder: (context) {
          switch (favoritesState) {
            case FavoriteJokesState.loading:
              return LoadingIndicator();
            case FavoriteJokesState.success:
              return ListView.builder(
                itemCount: favorites!.length,
                itemBuilder: (context, index) =>
                    SearchItem(joke: favorites[index]),
              );
            case FavoriteJokesState.empty:
              return Text("Empty");
            case FavoriteJokesState.favorite:
              return Text("favorite");
            case FavoriteJokesState.notFavorite:
              return Text("Empty");
            case FavoriteJokesState.error:
              return Text("error");
          }
        },
      )),
    );
  }
}
