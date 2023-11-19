import 'package:chuck_norris/routing/app_router.dart';
import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/paddings.dart';
import 'package:chuck_norris/src/features/search_joke/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/font_styles.dart';
import '../../../models/joke_model.dart';

class ListItemItemUI extends ConsumerWidget {
  const ListItemItemUI({Key? key, required this.joke}) : super(key: key);
  final JokeModel joke;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      margin: CustomPaddings.smallPaddingVertical,
      child: ElevatedButton(
        onPressed: () {
          ref.read(selectedJokeProvider.notifier).state = joke;
          context.push(RouteNames.jokeDetailScreen);
        },
        child: Padding(
          padding: CustomPaddings.mediumPaddingAll,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Categories",
              style: CustomFontStyles.kalamNormalBold,
            ),
            joke.categories.isEmpty || joke.categories[0] == ""
                ? Text("---",
                    style: GoogleFonts.kalam(
                        color: CustomColors.themColor.withOpacity(0.5)))
                : Row(
                    children: List.generate(
                        joke.categories.length,
                        (index) => Text(
                              joke.categories[index],
                              style: GoogleFonts.kalam(
                                  color:
                                      CustomColors.themColor.withOpacity(0.5)),
                            )),
                  ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  joke.value,
                  overflow: TextOverflow.ellipsis,
                  style: CustomFontStyles.lilitaOneNormal,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
