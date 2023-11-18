import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/enums.dart';
import 'package:chuck_norris/src/features/favorite_joke/app/providers.dart';
import 'package:chuck_norris/src/features/favorite_joke/models/favorite_joke_model.dart';
import 'package:chuck_norris/src/models/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  FavoriteButton({Key? key, required this.joke});

  final JokeModel joke;

  @override
  ConsumerState<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
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
            Text("Like"),
            SizedBox(
              width: 10,
            ),
            Icon(
              _favoritesState ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: redColor,
            )
          ],
        ));
  }
}
