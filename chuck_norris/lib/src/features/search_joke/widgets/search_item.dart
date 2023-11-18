import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/features/search_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/joke_model.dart';

class SearchItem extends ConsumerWidget {
  const SearchItem({Key? key, required this.joke}) : super(key: key);
  final JokeModel joke;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          ref.read(selectedJokeProvider.notifier).state = joke;
          context.push("/e");
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Categories",
              style: GoogleFonts.kalam(fontWeight: FontWeight.w700),
            ),
            joke.categories.length == 0
                ? Text("-",
                    style: GoogleFonts.kalam(color: themColor.withOpacity(0.5)))
                : Container(),
            Row(
              children: List.generate(
                  joke.categories.length,
                  (index) => Text(
                        joke.categories[index],
                        style: GoogleFonts.kalam(
                            color: themColor.withOpacity(0.5)),
                      )),
            ),
            Expanded(
              child: Center(
                child: Text(
                  joke.value,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lilitaOne(fontSize: 16),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
