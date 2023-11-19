import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/features/favorite_joke/providers.dart';
import 'package:chuck_norris/src/models/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';

class FavoriteButtonUI extends ConsumerStatefulWidget {
  const FavoriteButtonUI({super.key, required this.joke});

  final JokeModel joke;

  @override
  ConsumerState<FavoriteButtonUI> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButtonUI> {
  bool _favoritesState = false;

  @override
  void initState() {
    super.initState();
    checkIsFavorite();
  }

  checkIsFavorite() async {
    _favoritesState = await ref
        .read(favoritesControllerProvider.notifier)
        .isFavorite(widget.joke);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final statusChangedJoke = ref.watch(statusChangedJokeProvider);
    if (statusChangedJoke != null && statusChangedJoke.id == widget.joke.id) {
      checkIsFavorite();
    }
    return ElevatedButton(
        onPressed: () {
          if (_favoritesState) {
            ref
                .read(favoritesControllerProvider.notifier)
                .removeJokeFromFavorites(widget.joke);

            checkIsFavorite();
          } else {
            ref
                .read(favoritesControllerProvider.notifier)
                .addJokeTOFavorites(widget.joke);
            checkIsFavorite();
          }
          ref.read(favoritesControllerProvider.notifier).getFavorites();
        },
        child: Row(
          children: [
            Text(_favoritesState ? "Dislike" : "Like"),
            const SizedBox(
              width: 10,
            ),
            IntrinsicHeight(
              child: LikeButton(
                likeBuilder: (isLiked) {
                  return isLiked
                      ? Icon(
                          Icons.favorite,
                          color: CustomColors.redColor,
                          size: height * 0.025,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: CustomColors.disabledColor,
                          size: height * 0.025,
                        );
                },
                isLiked: _favoritesState,
                onTap: (isLiked) async {
                  if (_favoritesState) {
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .removeJokeFromFavorites(widget.joke);

                    checkIsFavorite();
                  } else {
                    ref
                        .read(favoritesControllerProvider.notifier)
                        .addJokeTOFavorites(widget.joke);
                    checkIsFavorite();
                  }
                  ref.read(favoritesControllerProvider.notifier).getFavorites();
                  return !_favoritesState;
                },
              ),
            ),
          ],
        ));
  }
}
